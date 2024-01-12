using Microsoft.AspNetCore.Mvc;
using WebApiRest.Data;
using WebApiRest.Models;
using WebApiRest.Utilities;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Text;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Authorization;

namespace WebApiRest.Controllers
{
    //[EnableCors("ReglasCors")]
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        readonly UsuarioData data = new();
        readonly Settings settings = new();

        public UsuarioController(IConfiguration configuration)
        {
            settings = configuration.GetSection("settings").Get<Settings>();
        }
        
        [HttpGet]
        [Route("list/{estados}")] //{authorId:int:min(1)} {lcid:int=1033}
        [Authorize(Roles = "Administrador,SuperAdministrador")] //En los claims estan guardados los roles al iniciar sesion en el token: ClaimTypes.Role
        public async Task<IActionResult> GetList([FromRoute] int estados)
        {
            UsuarioList result = await data.GetUsuarioList(estados);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpGet]
        [Route("list")] //{authorId:int:min(1)} {lcid:int=1033}
        [Authorize(Roles = "Administrador,SuperAdministrador")] //En los claims estan guardados los roles al iniciar sesion en el token: ClaimTypes.Role
        public async Task<IActionResult> GetSearch([FromQuery] int estados, [FromQuery] string buscar)
        {
            UsuarioList result = await data.GetUsuarioList(estados, buscar);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpGet]
        [Route("list/{estados}/{idUsuario}")] //{authorId:int:min(1)} {lcid:int=1033}
        [Authorize(Roles = "Administrador,SuperAdministrador")] //En los claims estan guardados los roles al iniciar sesion en el token: ClaimTypes.Role
        public async Task<IActionResult> GetItem([FromRoute] int estados, [FromRoute] int idUsuario)
        {
            UsuarioItem result = await data.GetUsuario(estados, idUsuario);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpPost]
        [Route("auth")]
        public async Task<IActionResult> LoginUsuario([FromBody] Usuario usuario, [FromQuery] int tipoLogin)
        {            
            UsuarioItem result = await data.Login(usuario, tipoLogin);

            if(result.Error == 0)
            {                
                var keyBytes = Encoding.ASCII.GetBytes(settings.SecretKey);
                var claims = new ClaimsIdentity();
                //claims.AddClaim(new Claim("correo", result.Usuario.Correo));  //ClaimTypes.NameIdentifier
                claims.AddClaim(new Claim("id", result.Usuario.IdUsuario.ToString()));
                claims.AddClaim(new Claim("nombre", result.Usuario.Nombre));
                claims.AddClaim(new Claim("idRol", result.Usuario.IdRol.ToString()));
                claims.AddClaim(new Claim("tipoLogin", tipoLogin.ToString()));
                claims.AddClaim(new Claim(ClaimTypes.Role, result.Usuario.Rol));
                var tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = claims,
                    Expires = DateTime.UtcNow.AddMinutes(settings.TimeExpTokenMin), //Tiempo de expiracion del token en minutos
                    SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(keyBytes), SecurityAlgorithms.HmacSha256Signature)
                };

                var tokenHandler = new JwtSecurityTokenHandler();
                var tokenConfig = tokenHandler.CreateToken(tokenDescriptor);
                string tokenCreado = tokenHandler.WriteToken(tokenConfig);
                result.Info = tokenCreado;
                result.Usuario = null;
            }

            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpPost]
        [Route("create")]
        public async Task<IActionResult> CreateItem([FromBody] Usuario usuario)
        {
            Response result = VF.ValidarUsuario(usuario);

            if(result.Error == 0)
            {
                result = await data.CreateUsuario(usuario);
            }
            
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpPut]
        [Route("update")]
        [Authorize(Roles = "Administrador,SuperAdministrador")] //En los claims estan guardados los roles al iniciar sesion en el token: ClaimTypes.Role
        public async Task<IActionResult> UpdateItem([FromBody] Usuario usuario)
        {
            Response result = VF.ValidarUsuario(usuario);

            if (result.Error == 0)
            {
                result = await data.UpdateUsuario(usuario);
            }

            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpDelete]
        [Route("delete")]
        [Authorize(Roles = "Administrador,SuperAdministrador")] //En los claims estan guardados los roles al iniciar sesion en el token: ClaimTypes.Role
        public async Task<IActionResult> DeleteItem([FromQuery] int idUsuario)
        {
            Response result = await data.DeleteUsuario(idUsuario);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }
    }
}
