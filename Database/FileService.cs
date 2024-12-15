// olddatavse
// using System;
// using System.Collections.Generic;
// using System.IO;
// using System.Linq;
// using System.Threading.Tasks;
// using RateReel.Models;

// namespace RateReel.Services
// {
//     public class FileService
//     {
//         private readonly string _filePath;

//         public FileService(string filePath)
//         {
//             _filePath = filePath;
//         }

//         // Save or update a user in the file
//         public async Task SaveUserAsync(User user)
//         {
//             var users = await GetUsersAsync();
//             var existingUser = users.FirstOrDefault(u => u.Username.Equals(user.Username, StringComparison.OrdinalIgnoreCase));

//             if (existingUser != null)
//             {
//                 throw new Exception("Username already exists.");
//             }

//             users.Add(user);
//             await WriteUsersAsync(users);
//         }

//         // Get all users from the file
//         public async Task<List<User>> GetUsersAsync()
//         {
//             var users = new List<User>();

//             if (!File.Exists(_filePath))
//                 return users;

//             var lines = await File.ReadAllLinesAsync(_filePath);
//             User currentUser = null;

//             foreach (var line in lines)
//             {
//                 string trimmedLine = line.Trim();

//                 if (string.IsNullOrEmpty(trimmedLine))
//                     continue;

//                 if (trimmedLine.StartsWith("{") && trimmedLine.EndsWith("}"))
//                 {
//                     // Single-line user entry
//                     currentUser = ParseUserLine(trimmedLine);
//                     if (currentUser != null)
//                         users.Add(currentUser);
//                 }
//                 else if (trimmedLine.StartsWith("{"))
//                 {
//                     // Start of multi-line user entry
//                     currentUser = new User();
//                 }
//                 else if (trimmedLine.EndsWith("}"))
//                 {
//                     // End of multi-line user entry
//                     if (currentUser != null)
//                     {
//                         users.Add(currentUser);
//                         currentUser = null;
//                     }
//                 }
//                 else
//                 {
//                     // Inside a multi-line user entry
//                     if (currentUser != null)
//                     {
//                         var keyValue = trimmedLine.Split(':', 2, StringSplitOptions.RemoveEmptyEntries);
//                         if (keyValue.Length == 2)
//                         {
//                             string key = keyValue[0].Trim().ToLower();
//                             string value = keyValue[1].Trim();

//                             switch (key)
//                             {
//                                 case "username":
//                                     currentUser.Username = value;
//                                     break;
//                                 case "password":
//                                     currentUser.Password = value;
//                                     break;
//                                 case "profilepicture":
//                                     currentUser.ProfilePicture = value;
//                                     break;
//                                 default:
//                                     break;
//                             }
//                         }
//                     }
//                 }
//             }

//             return users;
//         }

//         // Get a single user by username
//         public async Task<User> GetUserAsync(string username)
//         {
//             var users = await GetUsersAsync();
//             return users.FirstOrDefault(u => u.Username.Equals(username, StringComparison.OrdinalIgnoreCase));
//         }

//         // Update user details in the file
//         public async Task UpdateUserAsync(User updatedUser, string oldUsername)
//         {
//             var users = await GetUsersAsync();
//             var existingUser = users.FirstOrDefault(u => u.Username.Equals(oldUsername, StringComparison.OrdinalIgnoreCase));

//             if (existingUser != null)
//             {
//                 existingUser.Username = updatedUser.Username;
//                 existingUser.Password = updatedUser.Password;
//                 existingUser.ProfilePicture = updatedUser.ProfilePicture;
//             }
//             else
//             {
//                 users.Add(updatedUser);
//             }

//             await WriteUsersAsync(users);
//         }

//         // Helper method to write users to the file in custom format
//         private async Task WriteUsersAsync(List<User> users)
//         {
//             var lines = new List<string>();

//             foreach (var user in users)
//             {
//                 lines.Add("{");
//                 lines.Add($"    username: {user.Username}");
//                 lines.Add($"    password: {user.Password}");
//                 if (!string.IsNullOrEmpty(user.ProfilePicture))
//                 {
//                     lines.Add($"    profilepicture: {user.ProfilePicture}");
//                 }
//                 lines.Add("}");
//             }

//             await File.WriteAllLinesAsync(_filePath, lines);
//         }

//         // Helper method to parse a single-line user entry
//         private User ParseUserLine(string line)
//         {
//             var user = new User();
//             var content = line.Trim('{', '}').Trim();
//             var keyValuePairs = content.Split(',');

//             foreach (var pair in keyValuePairs)
//             {
//                 var keyValue = pair.Split(':', 2, StringSplitOptions.RemoveEmptyEntries);
//                 if (keyValue.Length == 2)
//                 {
//                     string key = keyValue[0].Trim().ToLower();
//                     string value = keyValue[1].Trim();

//                     switch (key)
//                     {
//                         case "username":
//                             user.Username = value;
//                             break;
//                         case "password":
//                             user.Password = value;
//                             break;
//                         case "profilepicture":
//                             user.ProfilePicture = value;
//                             break;
//                         default:
//                             break;
//                     }
//                 }
//             }

//             return user;
//         }
//     }
// }
