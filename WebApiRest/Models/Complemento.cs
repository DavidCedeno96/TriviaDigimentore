namespace WebApiRest.Models
{

    public class Complemento
    {
        public int IdCom { get; set; }
        public int IdSala { get; set; }
        public string ViendoIzquierda { get; set; }
        public string ViendoDerecha { get; set; }
        public string Color1 { get; set; }
        public string Color2 { get; set; }
        public string Plataforma1 { get; set; }
        public string Plataforma2 { get; set; }
        public string Plataforma3 { get; set; }
        public string Plataforma4 { get; set; }
        public string Decoracion1 { get; set; }
        public string Decoracion2 { get; set; }
        public string Decoracion3 { get; set; }
        public string Decoracion4 { get; set; }
        public string ObjetoCielo1 { get; set; }
        public string ObjetoCielo2 { get; set; }
        public string ObjetoFondo1 { get; set; }
        public string ObjetoFondo2 { get; set; }
        public string ObjetoFondo3 { get; set; }
        public string ObjetoFondo4 { get; set; }
        public string ObjetoFondoMovil { get; set; }
        public string ObjetoFinal { get; set; }
        public string Sonido { get; set; }

        public DateTime FechaCreacion { get; set; }
        public DateTime FechaModificacion { get; set; }
    }

    public class ComplementoInfo
    {
        public int IdCom { get; set; }
        public int IdSala { get; set; }
        public string NombreSala { get; set; }
        public IFormFile ViendoIzquierda { get; set; }
        public IFormFile ViendoDerecha { get; set; }
        public string Color1 { get; set; }
        public string Color2 { get; set; }
        public IFormFile Plataforma1 { get; set; }
        public IFormFile Plataforma2 { get; set; }
        public IFormFile Plataforma3 { get; set; }
        public IFormFile Plataforma4 { get; set; }
        public IFormFile Decoracion1 { get; set; }
        public IFormFile Decoracion2 { get; set; }
        public IFormFile Decoracion3 { get; set; }
        public IFormFile Decoracion4 { get; set; }
        public IFormFile ObjetoCielo1 { get; set; }
        public IFormFile ObjetoCielo2 { get; set; }
        public IFormFile ObjetoFondo1 { get; set; }
        public IFormFile ObjetoFondo2 { get; set; }
        public IFormFile ObjetoFondo3 { get; set; }
        public IFormFile ObjetoFondo4 { get; set; }
        public IFormFile ObjetoFondoMovil { get; set; }
        public IFormFile ObjetoFinal { get; set; }
        public IFormFile Sonido { get; set; }

        public DateTime FechaCreacion { get; set; }
        public DateTime FechaModificacion { get; set; }
    }

    public class ComplementoList
    {
        public string Info { get; set; }
        public int Error { get; set; }
        public List<Complemento> Lista { get; set; }
    }

    public class ComplementoItem
    {
        public string Info { get; set; }
        public int Error { get; set; }
        public Complemento Complemento { get; set; }
    }
}
