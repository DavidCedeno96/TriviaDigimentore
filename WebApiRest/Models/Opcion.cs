namespace WebApiRest.Models {
    public class Opcion {
        public int IdOpcion { get; set; }
        public string Nombre { get; set; }
        public int Correcta { get; set; }
        public int IdPregunta { get; set; }
        public int Estado { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaModificacion { get; set; }
    }

    public class OpcionList {
        public string Info { get; set; }
        public int Error { get; set; }
        public List<Opcion> Lista { get; set; }
    }

    public class OpcionItem {
        public string Info { get; set; }
        public int Error { get; set; }
        public Opcion Opcion { get; set; }
    }
}
