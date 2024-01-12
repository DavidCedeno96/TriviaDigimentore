﻿using System.Text.RegularExpressions;

namespace WebApiRest.Utilities
{
    // Esta clase es para Regular Expresions
    public static class RE
    {
        /*
         * La clave debe:
            Tener al menos 5 caracteres de longitud.
            Contener al menos un número.
            Contener al menos una letra mayúscula.
            Contener al menos una letra minúscula.
            Y solo los siguientes caracteres #@_-.
         */

        private static readonly string palabras = "^[a-zA-ZáÁéÉíÍóÓúÚüÜñÑ\\s]+$";
        private static readonly string palabrasNumeros = @"^[\p{L}\s\d]+$";
        private static readonly string dpi = @"^\d{13,15}$"; // es como la cédula pero en Guatemala
        private static readonly string celular = @"^\d{10}$";
        private static readonly string email = @"^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$";
        private static readonly string clave = @"^(?=.*[A-Z]+)(?=.*[a-z]+)(?=.*\d+)[#@_\-\.a-zA-Z\d]{5,}$";
        private static readonly string invalid = @"^[^<>]+$";
        private static readonly string caracteres50 = @"^.{1,50}$";         

        public static bool ValidRE(string text, string nombrePatron) 
        {                          
            if (string.IsNullOrEmpty(text))
            {
                return true;
            }

            Regex regex = Patron(nombrePatron);

            Match match = regex.Match(text.Trim());

            return match.Success;
        }

        private static Regex Patron(string patron)
        {
            Regex regex;
            switch (patron.ToLower())
            {
                case "palabras":
                    {
                        regex = new Regex(palabras);
                        break;
                    }
                case "palabras_numeros":
                    {
                        regex = new Regex(palabrasNumeros);
                        break;
                    }
                case "dpi":
                    {
                        regex = new Regex(dpi);
                        break;
                    }
                case "celular":
                    {
                        regex = new Regex(celular);
                        break;
                    }
                case "email":
                    {
                        regex = new Regex(email);
                        break;
                    }
                case "clave":
                    {
                        regex = new Regex(clave);
                        break;
                    }
                case "invalid":
                    {
                        regex = new Regex(invalid);
                        break;
                    }
                case "50":
                    {
                        regex = new Regex(caracteres50);
                        break;
                    }
                default:
                    {
                        regex = new Regex("");
                        break;
                    }
            }

            return regex;
        }
    }
}
