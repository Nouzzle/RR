using MongoDB.Driver;
using RateReel.Models;
using System;
using System.Threading.Tasks;
using MongoDB.Bson;


namespace RateReel.Services
{
    public class MongoDbService
    {
        private readonly IMongoCollection<User> _usersCollection;

        public MongoDbService()
        {
            //  MongoDB connection string
            var client = new MongoClient("mongodb://localhost:27017");
            var database = client.GetDatabase("RateReel"); // database name
            _usersCollection = database.GetCollection<User>("Users"); // collection name
        }

      public async Task SaveUserAsync(User user)
{
    try
    {
 
        if (string.IsNullOrEmpty(user.Id))
        {
            user.Id = ObjectId.GenerateNewId().ToString();
        }

        System.Diagnostics.Debug.WriteLine($"Checking if username {user.Username} already exists.");
        var existingUser = await _usersCollection.Find(u => u.Username == user.Username).FirstOrDefaultAsync();
        if (existingUser != null)
        {
            System.Diagnostics.Debug.WriteLine("Username already exists.");
            throw new Exception("Username already exists.");
        }

        System.Diagnostics.Debug.WriteLine("Inserting user into MongoDB.");
        await _usersCollection.InsertOneAsync(user);
        System.Diagnostics.Debug.WriteLine("User inserted successfully.");
    }
    catch (Exception ex)
    {
        System.Diagnostics.Debug.WriteLine($"MongoDB SaveUserAsync error: {ex.Message}");
        throw;
    }
}




  
        public async Task<User> GetUserAsync(string username)
        {
            try
            {
                var filter = Builders<User>.Filter.Eq(u => u.Username, username);
                return await _usersCollection.Find(filter).FirstOrDefaultAsync();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"MongoDB GetUserAsync error: {ex.Message}");
                throw;
            }
        }
    }
}
