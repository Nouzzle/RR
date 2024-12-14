using Microsoft.Maui.Controls;
using System;
using RateReel.Models;
using RateReel.Services;

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
                string username = UsernameEntry?.Text?.Trim() ?? string.Empty;
                string password = PasswordEntry?.Text?.Trim() ?? string.Empty;

                if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
                {
                    await DisplayAlert("Error", "Please enter both username and password.", "OK");
                    return;
                }

                var user = new User
                {
                    Username = username,
                    Password = password
                };

                // Save the new user to MongoDB
                await _mongoDbService.SaveUserAsync(user);
                await DisplayAlert("Success", "Registration successful!", "OK");
                await Shell.Current.GoToAsync("//Login");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Registration error: {ex.Message}");
                await DisplayAlert("Error", "An error occurred during registration.", "OK");
            }
        }
    }
}
