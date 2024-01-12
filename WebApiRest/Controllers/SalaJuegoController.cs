using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApiRest.Data;
using WebApiRest.Models;

namespace WebApiRest.Controllers
{
    //[EnableCors("ReglasCors")]
    [Route("api/[controller]")]
    [ApiController]
    public class SalaJuegoController : ControllerBase
    {

        readonly SalaJuegoData data = new();

        [HttpGet]
        [Route("list/{idSala}/{idJugador}")] //{authorId:int:min(1)} {lcid:int=1033}
        public async Task<IActionResult> GetList([FromRoute] int idSala, [FromRoute] int idJugador)
        {
            SalaJuegoList result = await data.GetSalaJuegoList(idSala, idJugador);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpGet]
        [Route("listByIds/{idSala}/{idJugador}")] //{authorId:int:min(1)} {lcid:int=1033}
        public async Task<IActionResult> GetListByIds([FromRoute] int idSala, [FromRoute] int idJugador)
        {
            SalaJuegoList result = await data.GetSalaJuegoListByIds(idSala, idJugador);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpPost]
        [Route("create")]
        public async Task<IActionResult> CreateItem([FromBody] SalaJuego salaJuego)
        {
            Response result = await data.CreateSalaJuego(salaJuego);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpPost]
        [Route("update")]
        public async Task<IActionResult> UpdateItem([FromBody] SalaJuego salaJuego)
        {
            Response result = await data.UpdateSalaJuego(salaJuego);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }
    }
}
