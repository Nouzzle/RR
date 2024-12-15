namespace RateReel.Pages.Homepage
{
    public partial class Settings : ContentPage
    {
        public bool IsDarkMode
        {
            get => Application.Current?.UserAppTheme == AppTheme.Dark;
            set
            {
                if (Application.Current != null)
                {
                    Application.Current.UserAppTheme = value ? AppTheme.Dark : AppTheme.Light;
                    OnPropertyChanged();
                }
            }
        }

        public bool NotificationsEnabled { get; set; } = true;

        public Settings()
        {
            InitializeComponent();
            BindingContext = this;
        }

        private void OnThemeToggled(object sender, ToggledEventArgs e)
        {
            IsDarkMode = e.Value;
        }

        private async void OnBackToHomeClicked(object sender, EventArgs e)
        {
            try
            {
                System.Diagnostics.Debug.WriteLine("Attempting navigation to Home...");
                
                // Navigate to Home 
                if (Shell.Current != null)
                {
                    await Shell.Current.GoToAsync($"///Home");
                    System.Diagnostics.Debug.WriteLine("Navigation successful");
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine("Shell.Current is null");
                    await DisplayAlert("Error", "Navigation service not available", "OK");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Navigation error: {ex.Message}");
                System.Diagnostics.Debug.WriteLine($"Stack trace: {ex.StackTrace}");
                await DisplayAlert("Error", "Could not navigate to Home", "OK");
            }
        }
    

        private async void OnBackAboutClicked(object sender, EventArgs e)
{
    await Navigation.PushAsync(new About());
}


        
    }
}