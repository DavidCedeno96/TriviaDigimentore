using WebApiRest.Models;

namespace WebApiRest.Utilities
{
    public static class WC
    {        
        private static readonly string satisfactorio = "Satisfactorio";        
        private static readonly string archivoExistente = "El archivo ya existe";
        private static readonly string errorArchivo = "Tipo de archivo no permitido";        
        private static readonly string errorLetrasNumeros = "Solo se permiten letras y números";
        private static readonly string errorLetras = "Solo se permiten letras";
        private static readonly string errorCelular = "El número de celular esta incorrecto";
        private static readonly string errorDpi = "Solo se permiten números y debe tener mínimo 13 y máximo 15 números";
        private static readonly string errorCorreo = "Ingrese un correo válido";
        private static readonly string errorClave = "Debe tener al menos 5 caracteres de longitud, contener al menos un número, contener al menos una letra mayúscula, contener al menos una letra minúscula o solo los siguientes caracteres #@_-.";
        private static readonly string invalid = "Tiene cacarteres invalidos";
        private static readonly string max50 = "Máximo 50 caracteres";

        public static string GetRutaImagen(IWebHostEnvironment env, string nombreImagen, string nombreCarpeta)
        {
            string rutaPrincipal = Path.Combine(env.ContentRootPath, "wwwroot", "Content", "Images", nombreCarpeta);
            return Path.Combine(rutaPrincipal, nombreImagen.Trim());
        }

        public static string GetRutaArchivo(IWebHostEnvironment env, string nombreArchivo, string nombreCarpeta)
        {
            string rutaPrincipal = Path.Combine(env.ContentRootPath, "wwwroot", "Content", "Archivos", nombreCarpeta);
            return Path.Combine(rutaPrincipal, nombreArchivo.Trim());
        }

        public static string GetTrim(string cadena)
        {
            if (cadena != null)
            {
                return cadena.Trim();
            }
            return "";
        }

        public static string GetHoraActual(DateTime dateTime)
        {            
            int hora = dateTime.Hour;
            int minuto = dateTime.Minute;
            int segundo = dateTime.Second;
            int miliSegundo = dateTime.Millisecond;

            return $"_{hora}-{minuto}-{segundo}-{miliSegundo}";
        }

        public static void EliminarArchivosAntiguos(IWebHostEnvironment env, string nombreCarpeta, string infoNombreArchivo)
        {            
            string rutaArchivos = Path.Combine(env.ContentRootPath, "wwwroot", "Content", "Archivos", nombreCarpeta);
            string[] archivos = Directory.GetFiles(rutaArchivos);            
            DateTime fechaHoy = DateTime.Now.Date;

            List<FileInfo> archivosAntiguos = archivos
                .Select(archivo => new FileInfo(archivo))
                .Where(info => !fechaHoy.Equals(info.LastWriteTime.Date) && info.Name.Contains(infoNombreArchivo))
                .ToList();                                   

            if (archivosAntiguos.Count > 0)
            {
                foreach (var archivo in archivosAntiguos)
                {
                    if (File.Exists(archivo.FullName))
                    {
                        File.Delete(archivo.FullName);
                    }                    
                }
            }            
        }

        public static bool GetArchivoPermitido(string tipos, string nombreArchivo)
        {
            string extension = Path.GetExtension(nombreArchivo.ToLower());
            List<string> tiposList = tipos.Split("/").ToList();
            foreach (string tipo in tiposList)
            {
                if (extension.Contains(tipo))
                {
                    return true;
                }
            }   
            
            return false;
        }

        public async static Task<string> SaveImagenGetNombre(IFormFile archivo, string tipoArchivo, IWebHostEnvironment env, string nombreCarpeta, string nombreArchivo, string imagenAnterior)
        {
            string fullNombre = "";

            if (archivo != null)
            {                
                Response response = VF.ValidarArchivo(env, archivo, tipoArchivo, nombreCarpeta);

                if (response.Error == 0)
                {
                    //Aqui eliminamos el archivo anterior
                    string rutaArchivoAnterior = GetRutaImagen(env, imagenAnterior, nombreCarpeta);
                    if (File.Exists(rutaArchivoAnterior))
                    {
                        File.Delete(rutaArchivoAnterior);
                    }


                    //Aqui creamos una nueva imagen
                    string extension = Path.GetExtension(archivo.FileName);
                    string rutaArchivo = GetRutaImagen(env, nombreArchivo+extension, nombreCarpeta);
                    FileStream fileStream = new(rutaArchivo, FileMode.Create);
                    await archivo.CopyToAsync(fileStream);
                    await fileStream.DisposeAsync();                    

                    fullNombre = nombreArchivo+extension;
                }
            }

            return fullNombre;
        }        

        public static string GetSatisfactorio()
        {
            return satisfactorio;
        }
        public static string GetErrorArchivo()
        {
            return errorArchivo;
        }
        public static string GetArchivoExistente()
        {
            return archivoExistente;
        }
        public static string GetErrorLetrasNumeros()
        {
            return errorLetrasNumeros;
        }
        public static string GetErrorLetras()
        {
            return errorLetras;
        }
        public static string GetErrorCelular()
        {
            return errorCelular;
        }
        public static string GetErrorCorreo()
        {
            return errorCorreo;
        }
        public static string GetErrorDpi()
        {
            return errorDpi;
        }
        public static string GetErrorClave()
        {
            return errorClave;
        }
        public static string GetInvalid()
        {
            return invalid;
        }
        public static string GetMax50()
        {
            return max50;
        }
    }
}
