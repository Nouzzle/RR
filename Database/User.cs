namespace RateReel.Models
{
    public class User
    {
        // MongoDB will automatically generate an _id for this field if it's not provided
        public string Id { get; set; } 

        public string Username { get; set; }
        
        // Add Password property to store user password
        public string Password { get; set; }

        public string ProfilePicture { get; set; } 
    }
}
