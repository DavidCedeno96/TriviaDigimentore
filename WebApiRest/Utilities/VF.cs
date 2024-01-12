using WebApiRest.Models;

namespace WebApiRest.Utilities
{
    // Este es para validar con las expresiones Regulares
    public static class VF 
    {        

        // Usuario
        public static Response ValidarUsuario(Usuario usuario)
        {
            Response result = new();
            bool validForm = true;
            if (!RE.ValidRE(usuario.Correo, "email"))
            {
                result.Error = 1;
                result.Info = WC.GetErrorCorreo();
                result.Campo = "correo";
                validForm = false;
            }
            if (!RE.ValidRE(usuario.Nombre, "invalid"))
            {
                result.Error = 1;
                result.Info = WC.GetInvalid();
                result.Campo = "nombre";
                validForm = false;
            }
            if (!RE.ValidRE(usuario.Telefono, "celular"))
            {
                result.Error = 1;
                result.Info = WC.GetErrorCelular();
                result.Campo = "celular";
                validForm = false;
            }
            if (!RE.ValidRE(usuario.Contrasena, "invalid"))
            {
                result.Error = 1;
                result.Info = WC.GetInvalid();
                result.Campo = "clave";
                validForm = false;
            }            

            if (validForm)
            {
                result.Error = 0;
                result.Info = WC.GetSatisfactorio();                
            }
            return result;
        }
        
        // Sala
        public static Response ValidarSala(Sala sala)
        {
            Response result = new();
            bool validForm = true;
            if (!RE.ValidRE(sala.Nombre, "palabras_numeros"))
            {
                result.Error = 1;
                result.Info = WC.GetErrorLetrasNumeros();
                result.Campo = "nombre";
                validForm = false;
            }            
            if (!RE.ValidRE(sala.Descripcion, "invalid"))
            {
                result.Error = 1;
                result.Info = WC.GetInvalid();
                result.Campo = "descripcion";
                validForm = false;
            }

            if (validForm)
            {
                result.Error = 0;
                result.Info = WC.GetSatisfactorio();                
            }
            return result;
        }

        // Pregunta
        public static Response ValidarPregunta(Pregunta pregunta) {
            Response result = new();
            bool validForm = true;
            if (!RE.ValidRE(pregunta.Nombre, "invalid")) {
                result.Error = 1;
                result.Info = WC.GetInvalid();
                result.Campo = "nombre pregunta";
                validForm = false;
            }

            if (validForm) {
                result.Error = 0;
                result.Info = WC.GetSatisfactorio();
            }
            return result;
        }

        // Pregunta
        public static Response ValidarOpcion(Opcion opcion) {
            Response result = new();
            bool validForm = true;
            if (!RE.ValidRE(opcion.Nombre, "invalid")) {
                result.Error = 1;
                result.Info = WC.GetInvalid();
                result.Campo = "nombre opcion";
                validForm = false;
            }

            if (validForm) {
                result.Error = 0;
                result.Info = WC.GetSatisfactorio();
            }
            return result;
        }

        // archivos
        public static Response ValidarArchivo(IWebHostEnvironment _env, IFormFile archivo, string tipos, string nombreCarpeta)
        {
            Response result = new();
            bool validForm = true;
            string rutaArchivo = WC.GetRutaImagen(_env, archivo.FileName, nombreCarpeta);

            if (!WC.GetArchivoPermitido(tipos, archivo.FileName))
            {
                result.Error = 1;
                result.Info = WC.GetErrorArchivo();
                result.Campo = "imagen";
                validForm = false;
            }
            
            if (File.Exists(rutaArchivo))
            {
                result.Error = 1;
                result.Info = WC.GetArchivoExistente();
                result.Campo = "imagen";
                validForm = false;
            }

            if (!RE.ValidRE(archivo.FileName, "invalid"))
            {
                result.Error = 1;
                result.Info = WC.GetInvalid();
                result.Campo = "imagen";
                validForm = false;

            }
            else if (!RE.ValidRE(archivo.FileName, "50"))
            {
                result.Error = 1;
                result.Info = WC.GetMax50();
                result.Campo = "imagen";
                validForm = false;
            }

            if (validForm)
            {
                result.Error = 0;
                result.Info = WC.GetSatisfactorio();
            }
            return result;

        }
    }
}
