namespace WebApiRest.Models
{
    public class SalaJuego
    {
        public int IdSala { get; set; }
        public int IdJugador { get; set; }
        public string Nombre { get; set; }
        public string Iniciales { get; set; }
        public int Posicion { get; set; }
        public int EstadoJuego { get; set; }
    }

    public class SalaJuegoList
    {
        public string Info { get; set; }
        public int Error { get; set; }
        public List<SalaJuego> Lista { get; set; }
    }
}
