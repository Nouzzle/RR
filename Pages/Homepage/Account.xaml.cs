using System.ComponentModel;
using System.Runtime.CompilerServices;
using Microsoft.Maui.Controls;
using System.Linq;
using RateReel.Models;
using RateReel.Services;

namespace RateReel.Pages.Homepage
{
    public partial class Account : ContentPage, INotifyPropertyChanged
    {
        private string username;
        private int reviewCount = 0;
        private int filmsCount = 0;
        private readonly MongoDbService _mongoDbService;
        

        public string Username
        {
            
            get => username;
            set
            {
                if (username != value)
                {
                    username = value;
                    OnPropertyChanged();
                }
            }
        }

        public int ReviewCount
        {
            get => reviewCount;
            set
            {
                if (reviewCount != value)
                {
                    reviewCount = value;
                    OnPropertyChanged();
                }
            }
        }

        public int FilmsCount
        {
            get => filmsCount;
            set
            {
                if (filmsCount != value)
                {
                    filmsCount = value;
                    OnPropertyChanged();
                }
            }
        }

       public Account()
{
    InitializeComponent();
    BindingContext = this;
    _mongoDbService = new MongoDbService();

    
    Username = App.LoggedInUsername;
    System.Diagnostics.Debug.WriteLine($"Account Page: Username set to {Username}");

   
   MessagingCenter.Subscribe<object>(this, "UpdateCounts", (sender) =>
    {
        UpdateCounts();
    });



   
    
    
}
          public void RefreshUserData()
        {
            OnPropertyChanged(nameof(Username)); 
            UpdateCounts();
        }
              public void UpdateCounts()
{
    var userReviews = App.Reviews.Where(r => r.Username == App.LoggedInUsername).ToList();
    ReviewCount = userReviews.Count;
    FilmsCount = userReviews.Select(r => r.MovieTitle).Distinct().Count();

    OnPropertyChanged(nameof(ReviewCount));
    OnPropertyChanged(nameof(FilmsCount));
}
      

        private async void OnBackToHomeClicked(object sender, EventArgs e)
        {
            try
            {
                System.Diagnostics.Debug.WriteLine("Attempting navigation to Home...");
                await Shell.Current.GoToAsync($"///Home");
                System.Diagnostics.Debug.WriteLine("Navigation successful");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Navigation error: {ex.Message}");
                await DisplayAlert("Error", "Could not navigate to Home", "OK");
            }
        }

       private async void OnDeleteAccountClicked(object sender, EventArgs e)
{
    var confirm = await DisplayAlert(
        "Delete Account",
        "Are you sure you want to delete your account? This action cannot be undone.",
        "Yes", "No");

    if (confirm)
    {
        try
        {
            await _mongoDbService.MarkReviewsAsDeletedAsync(App.LoggedInUsername);
            await _mongoDbService.DeleteUserAsync(App.LoggedInUsername);

            // Hapus hanya review milik user yang dihapus
            var userReviews = App.Reviews.Where(r => r.Username == App.LoggedInUsername).ToList();
            foreach (var review in userReviews)
            {
                App.Reviews.Remove(review);
            }

            App.LoggedInUsername = string.Empty;

            await Shell.Current.GoToAsync("//Login");
        }
        catch (Exception ex)
        {
            await DisplayAlert("Error", $"Failed to delete account: {ex.Message}", "OK");
        }
    }
}



protected override async void OnAppearing()
{
    base.OnAppearing();

    // Refresh username
    Username = App.LoggedInUsername;

    // Debuggduefguefue
    System.Diagnostics.Debug.WriteLine($"Account Page - Current Username: {Username}");

   
    await App.LoadReviewsAsync(_mongoDbService);

    // Update review n filmsz
    UpdateCounts();

   
    System.Diagnostics.Debug.WriteLine($"Account Page - Reviews Count: {ReviewCount}, Films Count: {FilmsCount}");

    OnPropertyChanged(nameof(Username));
}





        private async void OnSignOutClicked(object sender, EventArgs e)
        {
            bool answer = await DisplayAlert("Sign Out", "Are you sure you want to sign out?", "Yes", "No");
            if (answer)
            {
                try
                {
                    // Navigate back to login page
                    Shell.Current.FlyoutBehavior = FlyoutBehavior.Disabled;
                    Shell.SetNavBarIsVisible(Shell.Current, false);
                    Shell.SetTabBarIsVisible(Shell.Current, false);

                    App.LoggedInUsername = string.Empty; 
                    System.Diagnostics.Debug.WriteLine("LoggedInUsername cleared.");
                    App.ResetAppState(); // Reset app state
    await Shell.Current.GoToAsync("//Login");

                    // Hide navigation and tab bars
                    Shell.SetNavBarIsVisible(Shell.Current, false);
                    Shell.SetTabBarIsVisible(Shell.Current, false);
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"Sign out error: {ex}");
                    await DisplayAlert("Error", "Could not sign out", "OK");
                }
            }
        }


        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged([CallerMemberName] string propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public void OnLoginSuccess(string fetchedUsername)
        {
            Username = fetchedUsername;
            UpdateCounts(); // Update counts when user logs in
        }
    }
}