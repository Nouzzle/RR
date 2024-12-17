using Microsoft.Maui.Controls;
using System;
using RateReel.Models;
using RateReel.Services;
using RateReelHelpers; 

namespace RateReel.Pages.Authentication
{
    public partial class RegisterPage : ContentPage
    {
        private readonly MongoDbService _mongoDbService;

        public RegisterPage()
        {
            InitializeComponent();
            _mongoDbService = new MongoDbService();
        }

       private async void OnRegisterClicked(object sender, EventArgs e)
{
    try
    {
        System.Diagnostics.Debug.WriteLine("Register process started.");

        string username = UsernameEntry?.Text?.Trim() ?? string.Empty;
        string password = PasswordEntry?.Text?.Trim() ?? string.Empty;

        System.Diagnostics.Debug.WriteLine($"Username: {username}, Password: {password}");

     if (!ValidationHelper.IsValidUsername(username) || !ValidationHelper.IsStrongPassword(password))
                {
                    await DisplayAlert("Error", "Invalid username or password format. Username must have at least 3 characters, and the password must be at least 5 characters long and include a number.", "OK");

                    return;
                }

        var user = new User
        {
            Username = username,
            Password = password
        };

        System.Diagnostics.Debug.WriteLine("User object created.");

        // Save the new user to MongooouDB
        var mongoDbService = new MongoDbService();
        System.Diagnostics.Debug.WriteLine("MongoDB service initialized.");
        await mongoDbService.SaveUserAsync(user);
        System.Diagnostics.Debug.WriteLine("User saved successfully.");

        await DisplayAlert("Success", "Registration successful!", "OK");
        await Shell.Current.GoToAsync("//Login");
    }
    catch (Exception ex)
    {
        System.Diagnostics.Debug.WriteLine($"Registration error: {ex.Message}");
        await DisplayAlert("Error", $"An error occurred: {ex.Message}", "OK");
    }
}



    }
}
