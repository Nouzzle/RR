using MongoDB.Driver;
using RateReel.Models;
using System.Threading.Tasks;

namespace RateReel.Services
{
    public class MongoDbService
    {
        private readonly IMongoCollection<User> _usersCollection;

        // Constructor - Connects to MongoDB and sets up the Users collection
        public MongoDbService()
        {
            var client = new MongoClient("mongodb://localhost:27017"); // Your MongoDB connection string
            var database = client.GetDatabase("RateReelDB");
            _usersCollection = database.GetCollection<User>("Users");
        }

        // Get User by Username from MongoDB
        public async Task<User> GetUserAsync(string username)
        {
            // Query the database for a user with the specified username
            var user = await _usersCollection.Find(u => u.Username == username).FirstOrDefaultAsync();
            return user;
        }

        // Save User to MongoDB
        public async Task SaveUserAsync(User user)
        {
            // Insert a new user into the MongoDB Users collection
            await _usersCollection.InsertOneAsync(user);
        }
    }
}
