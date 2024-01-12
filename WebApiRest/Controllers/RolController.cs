using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using WebApiRest.Data;
using WebApiRest.Models;

namespace WebApiRest.Controllers
{
    //[EnableCors("ReglasCors")]
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class RolController : ControllerBase
    {
        readonly RolData data = new();

        [HttpGet]
        [Route("list/{estados}")] //{authorId:int:min(1)} {lcid:int=1033}
        public async Task<IActionResult> GetList([FromRoute] int estados)
        {
            RolList result = await data.GetRolList(estados);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }
    }
}
