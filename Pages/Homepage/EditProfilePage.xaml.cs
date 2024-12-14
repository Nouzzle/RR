using Microsoft.Maui.Controls;
using RateReel.Models;
using System;
using System.Threading.Tasks;

namespace RateReel.Pages.Homepage
{
    public partial class EditProfilePage : ContentPage
    {
        public EditProfilePage()
        {
            InitializeComponent();
            LoadUserProfile();
        }

        private async void LoadUserProfile()
        {
            try
            {
                var user = await App.FileService.GetUserAsync(App.LoggedInUsername);
                if (user != null)
                {
                    UsernameEntry.Text = user.Username;
                    PasswordEntry.Text = user.Password;
                }
                else
                {
                    await DisplayAlert("Error", "User not found.", "OK");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"LoadUserProfile error: {ex.Message}");
                await DisplayAlert("Error", "An error occurred while loading your profile.", "OK");
            }
        }

        private async void OnSaveClicked(object sender, EventArgs e)
{
    try
    {
        var username = UsernameEntry.Text?.Trim();
        var password = PasswordEntry.Text?.Trim();

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

        await App.FileService.UpdateUserAsync(user, App.LoggedInUsername);

        App.LoggedInUsername = username; // Update the global username

        await DisplayAlert("Success", "Profile updated successfully.", "OK");
        await Shell.Current.GoToAsync("//Account"); // Use exact case as registered in AppShell.xaml// Use exact route name with correct case
    }
    catch (Exception ex)
    {
        System.Diagnostics.Debug.WriteLine($"OnSaveClicked error: {ex.Message}");
        await DisplayAlert("Error", "An error occurred while saving your profile.", "OK");
    }
}
    }
}