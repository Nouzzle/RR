using System.ComponentModel;
using System.Runtime.CompilerServices;
using Microsoft.Maui.Controls;
using System.Linq;

namespace RateReel.Pages.Homepage
{
    public partial class Account : ContentPage, INotifyPropertyChanged
    {
        private string username;
        private int reviewCount = 0;
        private int filmsCount = 0;

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

    // Initialize Username from LoggedInUsername
    Username = App.LoggedInUsername;
    System.Diagnostics.Debug.WriteLine($"Account Page: Username set to {Username}");

    // Subscribe to the message
    MessagingCenter.Subscribe<FilmDetailsPage>(this, "UpdateCounts", (sender) => {
        UpdateCounts();
    });

    // Update the review and films count
    UpdateCounts();
}

        public void UpdateCounts()
        {
            var userReviews = App.Reviews.Where(r => r.Username == App.LoggedInUsername).ToList();
            ReviewCount = userReviews.Count;
            FilmsCount = userReviews.Select(r => r.MovieTitle).Distinct().Count();

            System.Diagnostics.Debug.WriteLine($"Account Page: ReviewCount={ReviewCount}, FilmsCount={FilmsCount}");
        }

        private async void OnEditProfileClicked(object sender, EventArgs e)
        {
            await DisplayAlert("Edit Profile", "Edit Profile functionality coming soon", "OK");
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

                    App.LoggedInUsername = string.Empty; // Clear the logged-in user
                    System.Diagnostics.Debug.WriteLine("LoggedInUsername cleared.");

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

        // INotifyPropertyChanged implementation
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