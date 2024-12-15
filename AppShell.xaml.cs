using Microsoft.Maui.Controls;
using System;

namespace RateReel
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();
            RegisterRoutes();

            MainThread.BeginInvokeOnMainThread(async () =>
            {
                try
                {
                    System.Diagnostics.Debug.WriteLine("Starting initial navigation...");
                    
                    // Disable navigation features for login
                    FlyoutBehavior = FlyoutBehavior.Disabled;
                    Shell.SetNavBarIsVisible(Shell.Current, false);
                    Shell.SetTabBarIsVisible(Shell.Current, false);

                    // Navigate to login using consistent path
                    await Shell.Current.GoToAsync("//Login");
                    System.Diagnostics.Debug.WriteLine("Navigated to Login page");
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"Navigation error: {ex.Message}");
                    System.Diagnostics.Debug.WriteLine($"Stack trace: {ex.StackTrace}");
                }
            });
        }

        private void RegisterRoutes()
        {
            try
            {
                System.Diagnostics.Debug.WriteLine("Registering routes...");
                
                // Use consistent route format without triple slashes
                Routing.RegisterRoute("Login", typeof(Pages.Authentication.LoginPage));
                Routing.RegisterRoute("Register", typeof(Pages.Authentication.RegisterPage));
                Routing.RegisterRoute("Home", typeof(Pages.Homepage.Homepage));
                Routing.RegisterRoute("Timeline", typeof(Pages.Homepage.Timeline));
                Routing.RegisterRoute("Films", typeof(Pages.Homepage.Films));
                Routing.RegisterRoute("Settings", typeof(Pages.Homepage.Settings));
                Routing.RegisterRoute("Account", typeof(Pages.Homepage.Account));
                
                System.Diagnostics.Debug.WriteLine("Routes registered successfully");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Route registration error: {ex.Message}");
            }
        }
    }
}