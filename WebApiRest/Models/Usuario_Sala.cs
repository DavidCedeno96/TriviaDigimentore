namespace WebApiRest.Models
{
    public class Usuario_Sala
    {
        public int IdUsuario { get; set; }
        public string Usuario { get; set; }
        public string Dpi { get; set; }
        public string Correo { get; set; }
        public string Rol { get; set; }
        public int IdSala { get; set; }
        public string Sala { get; set; }
        public string Descripcion { get; set; }
        public int Puntaje { get; set; }
        public int Tiempo { get; set; } 
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaModificacion { get; set; }
    }

    public class Usuario_SalaList
    {
        public string Info { get; set; }
        public int Error { get; set; }
        public List<Usuario_Sala> Lista { get; set; } 
    }
}
