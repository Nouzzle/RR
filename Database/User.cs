using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

public class User
{
    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)] // MongoDB to generate _id
    public string Id { get; set; } = ObjectId.GenerateNewId().ToString(); 

    public string Username { get; set; }
    public string Password { get; set; }
}
