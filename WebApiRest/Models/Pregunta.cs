﻿namespace WebApiRest.Models {

    public class Pregunta {
        public int IdPregunta { get; set; }
        public string Nombre { get; set; }
        public int IdSala { get; set; }
        public int Estado { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaModificacion { get; set; }
    }

    public class PreguntaList {
        public string Info { get; set; }
        public int Error { get; set; }
        public List<Pregunta> Lista { get; set; }
    }

    public class PreguntaItem {
        public string Info { get; set; }
        public int Error { get; set; }
        public Pregunta Pregunta { get; set; }
    }

    public class Pregunta_OpcionList {
        public string Info { get; set; }
        public int Error { get; set; }
        public Pregunta Pregunta { get; set; }
        public List<Opcion> OpcionList { get; set; }
    }

    public class PreguntaList_opciones
    {
        public string Info { get; set; }
        public int Error { get; set; }
        public List<Pregunta_OpcionList> List { get; set; }  
    }
}
