using Microsoft.Maui.Controls;
using RateReel.Models;
using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using RateReel.Services;
using System;

namespace RateReel.Pages.Authentication
{
    public partial class LoginPage : ContentPage, INotifyPropertyChanged
    {
        private string _username = string.Empty;
        
        public string Username
        {
            get => _username;
            set
            {
                if (_username != value)
                {
                    _username = value;
                    OnPropertyChanged();
                }
            }
        }

        private string _password = string.Empty;
        public string Password
        {
            get => _password;
            set
            {
                if (_password != value)
                {
                    _password = value;
                    OnPropertyChanged();
                }
            }
        }

        public List<SlideModel> Slides { get; set; }
        private readonly MongoDbService _mongoDbService;

        public LoginPage()
        {
            InitializeComponent();
            _mongoDbService = new MongoDbService();

            //  3 slides
            Slides = new List<SlideModel>
            {
                new SlideModel
                {
                    Type = SlideType.Intro,
                    Message = "Discover a world of movies! Get honest reviews before making your next watch choice."
                },
                new SlideModel
                {
                    Type = SlideType.Intro,
                    Message = "Join the community! Swipe left to sign up and start sharing your reviews."
                },
                new SlideModel
                {
                    Type = SlideType.Login
                }
            };

            BindingContext = this;
        }

        private void CarouselView_PositionChanged(object sender, PositionChangedEventArgs e)
        {
            
        }

        private async void OnLoginClicked(object sender, EventArgs e)
        {
            try
            {
                string username = Username?.Trim();
                string password = Password?.Trim();

                if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
                {
                    await DisplayAlert("Error", "Please enter both username and password.", "OK");
                    return;
                }

                // auth with MongoDB
                var user = await _mongoDbService.GetUserAsync(username);
                if (user != null && user.Password == password)
                {
                   
                     App.LoggedInUsername = user.Username; 

                    // Enable Flyout and navigation bars after successful login
                    Shell.Current.FlyoutBehavior = FlyoutBehavior.Flyout;
                    Shell.SetNavBarIsVisible(Shell.Current, true);
                    Shell.SetTabBarIsVisible(Shell.Current, true);
                    await App.LoadReviewsAsync(_mongoDbService);
                    await Shell.Current.GoToAsync("//Home");
                    
                }
                else
                {
                    await DisplayAlert("Error", "Invalid username or password.", "OK");
                    Username = string.Empty;
                    Password = string.Empty;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Login error: {ex.Message}");
                await DisplayAlert("Error", "An error occurred during login.", "OK");
            }
        }

        private async void OnRegisterTapped(object sender, EventArgs e)
        {
            await Shell.Current.GoToAsync("Register");
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
