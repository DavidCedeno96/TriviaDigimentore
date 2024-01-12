namespace WebApiRest.Utilities
{
    public class Conexion
    {
        // Esta es la cadena de coneccion
        private readonly string connectSqlServer = "";

        // Este es el constructor
        public Conexion()
        {
            var config = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json").Build();
            connectSqlServer = config.GetSection("ConnectionStrings:SqlServer_BDD").Value;
        }

        // Este es el metodo que retorna la cadena de conexion
        public string GetConnectionSqlServer()
        {
            return connectSqlServer;
        }
    }
}
