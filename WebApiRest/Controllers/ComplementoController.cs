using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WebApiRest.Data;
using WebApiRest.Models;
using WebApiRest.Utilities;

namespace WebApiRest.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ComplementoController : ControllerBase
    {
        readonly ComplementoData data = new();
        private readonly IWebHostEnvironment _env;
        private readonly string nombreCarpeta = "Complemento";

        public ComplementoController(IWebHostEnvironment env)
        {
            _env = env;
        }

        [HttpGet]
        [Route("item/{idSala}")] //{authorId:int:min(1)} {lcid:int=1033}
        [Authorize]
        public async Task<IActionResult> GetList([FromRoute] int idSala)
        {
            ComplementoItem result = await data.GetComplemento(idSala);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpPost]
        [Route("create")]
        [Authorize(Roles = "Administrador,SuperAdministrador")]
        public async Task<IActionResult> CreateItem([FromForm] ComplementoInfo complementoInfo)
        {
            Complemento complemento = new();            
            string nombreSala = complementoInfo.NombreSala;            

            complemento.IdSala = complementoInfo.IdSala;
            complemento.ViendoIzquierda = await WC.SaveImagenGetNombre(complementoInfo.ViendoIzquierda, "png", _env, nombreCarpeta, "viendoIzq_" + nombreSala, "");
            complemento.ViendoDerecha = await WC.SaveImagenGetNombre(complementoInfo.ViendoDerecha, "png", _env, nombreCarpeta, "viendoDer_" + nombreSala, "");
            complemento.Color1 = complementoInfo.Color1;
            complemento.Color2 = complementoInfo.Color2;
            complemento.Plataforma1 = await WC.SaveImagenGetNombre(complementoInfo.Plataforma1, "png", _env, nombreCarpeta, "plat1_" + nombreSala, "");
            complemento.Plataforma2 = await WC.SaveImagenGetNombre(complementoInfo.Plataforma2, "png", _env, nombreCarpeta, "plat2_" + nombreSala, "");
            complemento.Plataforma3 = await WC.SaveImagenGetNombre(complementoInfo.Plataforma3, "png", _env, nombreCarpeta, "plat3_" + nombreSala, "");
            complemento.Plataforma4 = await WC.SaveImagenGetNombre(complementoInfo.Plataforma4, "png", _env, nombreCarpeta, "plat4_" + nombreSala, "");
            complemento.Decoracion1 = await WC.SaveImagenGetNombre(complementoInfo.Decoracion1, "png", _env, nombreCarpeta, "dec1_" + nombreSala, "");
            complemento.Decoracion2 = await WC.SaveImagenGetNombre(complementoInfo.Decoracion2, "png", _env, nombreCarpeta, "dec2_" + nombreSala, "");
            complemento.Decoracion3 = await WC.SaveImagenGetNombre(complementoInfo.Decoracion3, "png", _env, nombreCarpeta, "dec3_" + nombreSala, "");
            complemento.Decoracion4 = await WC.SaveImagenGetNombre(complementoInfo.Decoracion4, "png", _env, nombreCarpeta, "dec4_" + nombreSala, "");
            complemento.ObjetoCielo1 = await WC.SaveImagenGetNombre(complementoInfo.ObjetoCielo1, "png", _env, nombreCarpeta, "objCie1_" + nombreSala, "");
            complemento.ObjetoCielo2 = await WC.SaveImagenGetNombre(complementoInfo.ObjetoCielo2, "png", _env, nombreCarpeta, "objCie2_" + nombreSala, "");
            complemento.ObjetoFondo1 = await WC.SaveImagenGetNombre(complementoInfo.ObjetoFondo1, "png", _env, nombreCarpeta, "objFon1_" + nombreSala, "");
            complemento.ObjetoFondo2 = await WC.SaveImagenGetNombre(complementoInfo.ObjetoFondo2, "png", _env, nombreCarpeta, "objFon2_" + nombreSala, "");
            complemento.ObjetoFondo3 = await WC.SaveImagenGetNombre(complementoInfo.ObjetoFondo3, "png", _env, nombreCarpeta, "objFon3_" + nombreSala, "");
            complemento.ObjetoFondo4 = await WC.SaveImagenGetNombre(complementoInfo.ObjetoFondo4, "png", _env, nombreCarpeta, "objFon4_" + nombreSala, "");
            complemento.ObjetoFondoMovil = await WC.SaveImagenGetNombre(complementoInfo.ObjetoFondoMovil, "png", _env, nombreCarpeta, "objFonMov_" + nombreSala, "");
            complemento.ObjetoFinal = await WC.SaveImagenGetNombre(complementoInfo.ObjetoFinal, "png", _env, nombreCarpeta, "objFinal_" + nombreSala, "");
            complemento.Sonido = await WC.SaveImagenGetNombre(complementoInfo.Sonido, "mp3", _env, nombreCarpeta, "sonido_" + nombreSala, "");

            complemento.IsDecoration = complementoInfo.IsDecoration;
            complemento.IsSkyObjects = complementoInfo.IsSkyObjects;
            complemento.IsBackgroundObjects = complementoInfo.IsBackgroundObjects;
            complemento.IsFinalObject = complementoInfo.IsFinalObject;


            Response response = await data.CreateComplemento(complemento);


            return StatusCode(StatusCodes.Status200OK, new { response });
        }

        [HttpPut]
        [Route("update")]
        [Authorize(Roles = "Administrador,SuperAdministrador")]
        public async Task<IActionResult> UpdateItem([FromForm] ComplementoInfo complementoInfo)
        {
            Complemento complemento = new();
            string nombreSala = complementoInfo.NombreSala;

            ComplementoItem resultItem = await data.GetComplemento(complementoInfo.IdSala);

            complemento.IdCom = complementoInfo.IdCom;
            complemento.ViendoIzquierda = await WC.SaveImagenGetNombre(complementoInfo.ViendoIzquierda, "png", _env, nombreCarpeta, "viendoIzq_" + nombreSala, resultItem.Complemento.ViendoIzquierda);
            complemento.ViendoDerecha = await WC.SaveImagenGetNombre(complementoInfo.ViendoDerecha, "png", _env, nombreCarpeta, "viendoDer_" + nombreSala, resultItem.Complemento.ViendoDerecha);
            complemento.Color1 = complementoInfo.Color1;
            complemento.Color2 = complementoInfo.Color2;
            complemento.Plataforma1 = await WC.SaveImagenGetNombre(complementoInfo.Plataforma1, "png", _env, nombreCarpeta, "plat1_" + nombreSala, resultItem.Complemento.Plataforma1);
            complemento.Plataforma2 = await WC.SaveImagenGetNombre(complementoInfo.Plataforma2, "png", _env, nombreCarpeta, "plat2_" + nombreSala, resultItem.Complemento.Plataforma2);
            complemento.Plataforma3 = await WC.SaveImagenGetNombre(complementoInfo.Plataforma3, "png", _env, nombreCarpeta, "plat3_" + nombreSala, resultItem.Complemento.Plataforma3);
            complemento.Plataforma4 = await WC.SaveImagenGetNombre(complementoInfo.Plataforma4, "png", _env, nombreCarpeta, "plat4_" + nombreSala, resultItem.Complemento.Plataforma4);
            complemento.Decoracion1 = await WC.SaveImagenGetNombre(complementoInfo.Decoracion1, "png", _env, nombreCarpeta, "dec1_" + nombreSala, resultItem.Complemento.Decoracion1);
            complemento.Decoracion2 = await WC.SaveImagenGetNombre(complementoInfo.Decoracion2, "png", _env, nombreCarpeta, "dec2_" + nombreSala, resultItem.Complemento.Decoracion2);
            complemento.Decoracion3 = await WC.SaveImagenGetNombre(complementoInfo.Decoracion3, "png", _env, nombreCarpeta, "dec3_" + nombreSala, resultItem.Complemento.Decoracion3);
            complemento.Decoracion4 = await WC.SaveImagenGetNombre(complementoInfo.Decoracion4, "png", _env, nombreCarpeta, "dec4_" + nombreSala, resultItem.Complemento.Decoracion4);
            complemento.ObjetoCielo1 = await WC.SaveImagenGetNombre(complementoInfo.ObjetoCielo1, "png", _env, nombreCarpeta, "objCie1_" + nombreSala, resultItem.Complemento.ObjetoCielo1);
            complemento.ObjetoCielo2 = await WC.SaveImagenGetNombre(complementoInfo.ObjetoCielo2, "png", _env, nombreCarpeta, "objCie2_" + nombreSala, resultItem.Complemento.ObjetoCielo2);
            complemento.ObjetoFondo1 = await WC.SaveImagenGetNombre(complementoInfo.ObjetoFondo1, "png", _env, nombreCarpeta, "objFon1_" + nombreSala, resultItem.Complemento.ObjetoFondo1);
            complemento.ObjetoFondo2 = await WC.SaveImagenGetNombre(complementoInfo.ObjetoFondo2, "png", _env, nombreCarpeta, "objFon2_" + nombreSala, resultItem.Complemento.ObjetoFondo2);
            complemento.ObjetoFondo3 = await WC.SaveImagenGetNombre(complementoInfo.ObjetoFondo3, "png", _env, nombreCarpeta, "objFon3_" + nombreSala, resultItem.Complemento.ObjetoFondo3);
            complemento.ObjetoFondo4 = await WC.SaveImagenGetNombre(complementoInfo.ObjetoFondo4, "png", _env, nombreCarpeta, "objFon4_" + nombreSala, resultItem.Complemento.ObjetoFondo4);
            complemento.ObjetoFondoMovil = await WC.SaveImagenGetNombre(complementoInfo.ObjetoFondoMovil, "png", _env, nombreCarpeta, "objFonMov_" + nombreSala, resultItem.Complemento.ObjetoFondoMovil);
            complemento.ObjetoFinal = await WC.SaveImagenGetNombre(complementoInfo.ObjetoFinal, "png", _env, nombreCarpeta, "objFinal_" + nombreSala, resultItem.Complemento.ObjetoFinal);
            complemento.Sonido = await WC.SaveImagenGetNombre(complementoInfo.Sonido, "mp3", _env, nombreCarpeta, "sonido_" + nombreSala, resultItem.Complemento.Sonido);

            complemento.IsDecoration = complementoInfo.IsDecoration;
            complemento.IsSkyObjects = complementoInfo.IsSkyObjects;
            complemento.IsBackgroundObjects = complementoInfo.IsBackgroundObjects;
            complemento.IsFinalObject = complementoInfo.IsFinalObject;

            Response response = await data.UpdateComplemento(complemento);


            return StatusCode(StatusCodes.Status200OK, new { response });
        }
    }
}
