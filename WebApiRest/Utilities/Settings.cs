namespace WebApiRest.Utilities
{
    public class Settings
    {
        public string Origin { get; set; }
        public string SecretKey { get; set; }
        public int TimeExpTokenMin { get; set; }
        public bool HttpsClient { get; set; }        
    }
}
