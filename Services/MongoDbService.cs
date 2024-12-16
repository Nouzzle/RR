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
        
         private readonly IMongoCollection<Film> _filmCollection;

      private readonly IMongoCollection<Review> _reviewsCollection;

public MongoDbService()
{
    var client = new MongoClient("mongodb://localhost:27017");
    var database = client.GetDatabase("RateReel");
    
    _usersCollection = database.GetCollection<User>("Users");
    _reviewsCollection = database.GetCollection<Review>("Reviews"); 
}


    public async Task MarkReviewsAsDeletedAsync(string username)
{
    var filter = Builders<Review>.Filter.Eq(r => r.Username, username);
    var update = Builders<Review>.Update.Set(r => r.Username, "Account Deleted");
    await _reviewsCollection.UpdateManyAsync(filter, update);
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

        public async Task SaveReviewAsync(Review review)
{
    await _reviewsCollection.InsertOneAsync(review);
}

public async Task<List<Review>> GetReviewsByUserAsync(string username)
{
    return await _reviewsCollection.Find(r => r.Username == username).ToListAsync();
}

public async Task<List<Review>> GetReviewsByMovieAsync(string movieTitle)
{
    return await _reviewsCollection.Find(r => r.MovieTitle == movieTitle).ToListAsync();
}
public async Task<List<Review>> GetReviewsByUsernameAsync(string username)
{
    try
    {
        var filter = Builders<Review>.Filter.Eq(r => r.Username, username);
        return await _reviewsCollection.Find(filter).ToListAsync();
    }
    catch (Exception ex)
    {
        System.Diagnostics.Debug.WriteLine($"Error fetching reviews: {ex.Message}");
        return new List<Review>();
    }
}

public async Task<List<Review>> GetUserReviewsAsync(string username)
{
    var filter = Builders<Review>.Filter.Eq(r => r.Username, username);
    var result = await _reviewsCollection.Find(filter).ToListAsync();
    return result;
}

public async Task SaveOrUpdateReviewAsync(Review review)
{
    var filter = Builders<Review>.Filter.And(
        Builders<Review>.Filter.Eq(r => r.Username, review.Username),
        Builders<Review>.Filter.Eq(r => r.MovieTitle, review.MovieTitle)
    );

    var update = Builders<Review>.Update
        .Set(r => r.Rating, review.Rating)
        .Set(r => r.ReviewText, review.ReviewText)
        .Set(r => r.ReviewDate, DateTime.Now);

    var options = new UpdateOptions { IsUpsert = true }; // Insert if not exist, update if exist

    await _reviewsCollection.UpdateOneAsync(filter, update, options);
}


public async Task DeleteUserAsync(string username)
        {
            var filter = Builders<User>.Filter.Eq(u => u.Username, username);
            await _usersCollection.DeleteOneAsync(filter);
            System.Diagnostics.Debug.WriteLine($"User with username {username} has been deleted.");
        }

public async Task<List<Review>> GetAllReviewsAsync()
{
    var result = await _reviewsCollection.Find(_ => true).ToListAsync();
    return result;
}

public async Task<List<Review>> GetReviewsAsync()
{
    return await _reviewsCollection.Find(_ => true).ToListAsync();
}







        
    }
}
