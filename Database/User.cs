using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

public class User
{
    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)] 
    public string Id { get; set; } = ObjectId.GenerateNewId().ToString(); 

    public string Username { get; set; }
    public string Password { get; set; }
}
