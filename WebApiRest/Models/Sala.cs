namespace WebApiRest.Models
{
    public class Sala
    {
        public int IdSala { get; set; }
        public string Nombre { get; set; }
        public string Imagen { get; set; }
        public string Descripcion { get; set; }
        public int IdModoJuego { get; set; }
        public string ModoJuego { get; set; }
        public int Estado { get; set; }
        public int TotalPreguntas { get; set; }
        public int CantJugadas { get; set; }
        public int TiempoXpregunta { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaModificacion { get; set; }
        public DateTime FechaActivacion { get; set; }
        public DateTime FechaCierre { get; set; }
        public DateTime FechaCierreLondon { get; set; }
    }

    public class SalaReciente
    {
        public int IdSala { get; set; }
        public int IdUsuario { get; set; }
    }

    public class SalaList
    {
        public string Info { get; set; }
        public int Error { get; set; }
        public List<Sala> Lista { get; set; }
    }

    public class SalaItem
    {
        public string Info { get; set; }
        public int Error { get; set; }
        public Sala Sala { get; set; }
    }
}
