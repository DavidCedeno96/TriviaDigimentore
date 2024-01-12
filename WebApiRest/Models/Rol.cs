namespace WebApiRest.Models
{
    public class Rol
    {
        public int IdRol { get; set; }
        public string Nombre { get; set; }
        public int Estado { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaModificacion { get; set; }        
    }

    public class RolList
    {
        public string Info { get; set; }
        public int Error { get; set; }
        public List<Rol> Lista { get; set; }
    }
    
    public class RolItem 
    {
        public string Info { get; set; }
        public int Error { get; set; }
        public Rol Rol { get; set; }
    }
}
