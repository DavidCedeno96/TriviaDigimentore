using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using System.Data;
using WebApiRest.Data;
using WebApiRest.Models;
using WebApiRest.Utilities;

namespace WebApiRest.Controllers
{
    //[EnableCors("ReglasCors")]
    [Route("api/[controller]")]
    //[Authorize] // en los claims estan guardados los roles al iniciar sesion en el token: ClaimTypes.Role poner => [Authorize(Roles = "Administrador,SuperAdministrador")] 
    [ApiController]
    public class SalaController : ControllerBase
    {

        readonly SalaData data = new();
        private readonly IWebHostEnvironment _env;
        private readonly string nombreCarpeta = "Sala";

        public SalaController(IWebHostEnvironment env)
        {
            _env = env;
        }        

        [HttpGet]
        [Route("list/{estados}")] //{authorId:int:min(1)} {lcid:int=1033}
        [Authorize]
        public async Task<IActionResult> GetList([FromRoute] int estados)
        {
            SalaList result = await data.GetSalaList(estados);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpGet]
        [Route("list/{estados}/{idSala}/{idUsuario}")] //{authorId:int:min(1)} {lcid:int=1033}        
        public async Task<IActionResult> GetItem([FromRoute] int estados, [FromRoute] int idSala, [FromRoute] int idUsuario)
        {
            SalaItem result = await data.GetSala(estados, idSala, idUsuario);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpGet]
        [Route("list")]
        [Authorize]
        public async Task<IActionResult> GetSearch([FromQuery] int estados, [FromQuery] string buscar)
        {
            SalaList result = await data.GetSalaList(estados, buscar);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpGet]
        [Route("reporte/sala/{estados}")]
        [Authorize(Roles = "Administrador,SuperAdministrador")]
        public async Task<IActionResult> ReportSala([FromRoute] int estados)
        {
            Response result = new();
            DataTable dt = new();

            string hora = WC.GetHoraActual(DateTime.Now);
            string nombreArchivo = $"Salas{hora}.xls";
            string rutaArchivo = WC.GetRutaArchivo(_env, nombreArchivo, nombreCarpeta);

            WC.EliminarArchivosAntiguos(_env, nombreCarpeta, "Salas");

            dt.Columns.Add("NOMBRE", typeof(string));
            dt.Columns.Add("MODO DE JUEGO", typeof(string));
            dt.Columns.Add("DESCRIPCIÓN", typeof(string));
            dt.Columns.Add("FECHA", typeof(DateTime));
            
            SalaList response = await data.GetSalaList(estados);

            if (response.Error == 0)
            {
                if (response.Lista.Count > 0)
                {
                    foreach (var item in response.Lista)
                    {
                        DataRow row = dt.NewRow();
                        row[0] = item.Nombre;
                        row[1] = item.ModoJuego;
                        row[2] = item.Descripcion;
                        row[3] = item.FechaCreacion;
                        dt.Rows.Add(row);
                    }

                    HSSFWorkbook workbook = new();
                    ISheet hoja = workbook.CreateSheet("Salas");
                    IRow headerRow = hoja.CreateRow(0);

                    for (int i = 0; i < dt.Columns.Count; i++)
                    {
                        headerRow.CreateCell(i).SetCellValue(dt.Columns[i].ColumnName);
                    }

                    for (int rowIndex = 0; rowIndex < dt.Rows.Count; rowIndex++)
                    {
                        IRow dataRow = hoja.CreateRow(rowIndex + 1);

                        for (int columnIndex = 0; columnIndex < dt.Columns.Count; columnIndex++)
                        {
                            dataRow.CreateCell(columnIndex).SetCellValue(dt.Rows[rowIndex][columnIndex].ToString());
                        }
                    }

                    //Aqui crea el archivo
                    FileStream fileStream = new(rutaArchivo, FileMode.Create);
                    workbook.Write(fileStream);
                    fileStream.Dispose();

                    result.Info = nombreArchivo;
                    result.Error = 0;
                }
                else
                {
                    result.Info = "La lista esta vacia";
                    result.Error = 1;
                }
            }
            else
            {
                result.Info = response.Info;
                result.Error = 1;
            }

            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpGet]
        [Route("listReciente/{estados}/{idUsuario}")]
        [Authorize]
        public async Task<IActionResult> GetListReciente([FromRoute] int estados, [FromRoute] int idUsuario)
        {
            SalaList result = await data.GetSalaRecienteList(estados, idUsuario);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpPost]
        [Route("createReciente")]
        [Authorize]
        public async Task<IActionResult> CreateItemReciente([FromBody] SalaReciente salaReciente)
        {
            Response result = await data.CreateSalaReciente(salaReciente);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpPost]
        [Route("create")]
        [Authorize(Roles = "Administrador,SuperAdministrador")]
        public async Task<IActionResult> CreateItem([FromForm] IFormFile archivo, [FromForm] Sala sala)
        {
            Response result = VF.ValidarSala(sala);
            string rutaArchivo = "";

            if (archivo != null && result.Error == 0)
            {
                result = VF.ValidarArchivo(_env, archivo, "jpg/jpeg/png", nombreCarpeta);
                rutaArchivo = WC.GetRutaImagen(_env, archivo.FileName, nombreCarpeta);

                sala.Imagen = archivo.FileName.Trim();
            }
            else
            {
                sala.Imagen = "";
            }            

            if (result.Error == 0)
            {
                result = await data.CreateSala(sala);
                if (result.Error == 0 && !rutaArchivo.Equals(""))
                {
                    //Aqui creamos una nueva imagen                    
                    FileStream fileStream = new(rutaArchivo, FileMode.Create);
                    await archivo.CopyToAsync(fileStream);
                    await fileStream.DisposeAsync();
                }
            }

            return StatusCode(StatusCodes.Status200OK, new { result });
        }     

        [HttpPut]
        [Route("update")]
        [Authorize(Roles = "Administrador,SuperAdministrador")]
        public async Task<IActionResult> UpdateItem([FromForm] IFormFile archivo, [FromForm] Sala sala)
        {
            Response result = VF.ValidarSala(sala);
            string rutaArchivo = "";

            if (archivo != null && result.Error == 0)
            {
                result = VF.ValidarArchivo(_env, archivo, "jpg/jpeg/png", nombreCarpeta);
                rutaArchivo = WC.GetRutaImagen(_env, archivo.FileName, nombreCarpeta);

                sala.Imagen = WC.GetTrim(archivo.FileName);
            }
            else
            {
                sala.Imagen = "";
            }

            if (result.Error == 0)
            {
                result = await data.UpdateSala(sala);
                if (result.Error == 0 && !rutaArchivo.Equals("")) {
                    string imagenAnterior = result.Info.Split(":")[1];
                    result.Info = result.Info.Split(",")[0];

                    //Aqui eliminamos el archivo anterior
                    string rutaArchivoAnterior = WC.GetRutaImagen(_env, imagenAnterior, nombreCarpeta);
                    if (System.IO.File.Exists(rutaArchivoAnterior)) {
                        System.IO.File.Delete(rutaArchivoAnterior);
                    }

                    //Aqui creamos una nueva imagen
                    FileStream fileStream = new(rutaArchivo, FileMode.Create);
                    await archivo.CopyToAsync(fileStream);
                    await fileStream.DisposeAsync();
                }
            }        

            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpPut]
        [Route("updateEstado")]
        [Authorize(Roles = "Administrador,SuperAdministrador")]
        public async Task<IActionResult> UpdateItemEstado([FromBody] Sala sala)
        {
            Response result = await data.UpdateSalaEstado(sala);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpDelete]
        [Route("delete")]
        [Authorize(Roles = "Administrador,SuperAdministrador")]
        public async Task<IActionResult> DeleteItem([FromQuery] int idSala)
        {
            Response result = await data.DeleteSala(idSala);
            
            if(result.Error == 0)
            {
                string imagenAnterior = result.Info.Split(':')[1];
                string nombreSala = result.Info.Split(':')[2];

                //Aqui eliminamos el archivo anterior
                string rutaArchivoAnterior = WC.GetRutaImagen(_env, imagenAnterior, nombreCarpeta);
                if (System.IO.File.Exists(rutaArchivoAnterior))
                {
                    System.IO.File.Delete(rutaArchivoAnterior);
                }

                WC.EliminarVariasImagenes(_env, "Complemento", $"_{nombreSala}");

                result.Info = result.Info.Split(',')[0];
            }

            return StatusCode(StatusCodes.Status200OK, new { result });
        }
    }
}
