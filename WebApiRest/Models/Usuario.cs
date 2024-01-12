﻿namespace WebApiRest.Models
{
    public class Usuario
    {
        public int IdUsuario { get; set; }
        public string Nombre { get; set; }
        public string Correo { get; set; }
        public string Contrasena { get; set; }
        public string Telefono { get; set; }
        public int IdRol { get; set; } 
        public string Rol { get; set; } 
        public int Estado { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaModificacion { get; set; }
    }

    public class UsuarioList
    {
        public string Info { get; set; }
        public int Error { get; set; }
        public List<Usuario> Lista { get; set; }
    }

    public class UsuarioItem
    {
        public string Info { get; set; }
        public int Error { get; set; }
        public Usuario Usuario { get; set; }
    }
}
