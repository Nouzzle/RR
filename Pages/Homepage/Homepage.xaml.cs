using System;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Diagnostics;
using System.Linq;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Dispatching; 
using RateReel.Models;
using RateReel.Services; 
using Microsoft.Extensions.DependencyInjection;

namespace RateReel.Pages.Homepage
{
    public partial class Homepage : ContentPage
    {
        public ObservableCollection<Film> AllMovies { get; set; }
        public ObservableCollection<Film> FilteredMovies { get; set; }

        
        public ObservableCollection<Review> Reviews => App.Reviews;

        private readonly TmdbService _tmdbService;

       public ObservableCollection<Review> RecentReviews { get; set; }

        public Homepage()
        {
            InitializeComponent();
            AllMovies = new ObservableCollection<Film>();
            FilteredMovies = new ObservableCollection<Film>();

            RecentReviews = new ObservableCollection<Review>();
            App.Reviews.CollectionChanged += Reviews_CollectionChanged;
            LoadRecentReviews();
            // Retrieve TmdbService from the service provider
            _tmdbService = App.ServiceProvider.GetService<TmdbService>();

            BindingContext = this;
            FilmsCollectionView.ItemsSource = FilteredMovies;

            // Fetch films on initialization
            FetchFilmsAsync();
        }

         private void LoadRecentReviews()
        {
            try
            {
                
                MainThread.BeginInvokeOnMainThread(() =>
                {
                    var recent = App.Reviews
                        .OrderByDescending(r => r.ReviewDate)
                        .Take(5) // Display top 5 recent reviews
                        .ToList();

                    Debug.WriteLine("Loading Recent Reviews:");
                    foreach (var review in recent)
                    {
                        Debug.WriteLine($"{review.Username} - {review.MovieTitle} - {review.ReviewDate}");
                    }

                    RecentReviews.Clear();
                    foreach (var review in recent)
                    {
                        RecentReviews.Add(review);
                    }

                    Debug.WriteLine($"Total Recent Reviews Loaded: {RecentReviews.Count}");
                });
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error in LoadRecentReviews: {ex.Message}");
              
            }
        }

        private void Reviews_CollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
        {
            Debug.WriteLine("App.Reviews collection changed.");
            LoadRecentReviews();
        }

        private async void FetchFilmsAsync()
        {
            try
            {
                var films = await _tmdbService.GetPopularFilmsAsync();
                AllMovies.Clear();
                foreach (var film in films)
                {
                    AllMovies.Add(film);
                }

                // Initialize FilteredMovies 
                FilteredMovies.Clear();
                foreach (var film in AllMovies)
                {
                    FilteredMovies.Add(film);
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"Failed to load films: {ex.Message}", "OK");
                Debug.WriteLine($"Error fetching films: {ex}");
            }
        }

        private async void OnFilmTapped(object sender, TappedEventArgs e)
        {
            var filmTitle = e.Parameter as string;

            var selectedFilm = AllMovies.FirstOrDefault(film => film.Title.Equals(filmTitle, StringComparison.OrdinalIgnoreCase));

            if (selectedFilm != null)
            {
                await Navigation.PushAsync(new FilmDetailsPage(selectedFilm));
            }
        }

        private async void OnFilmSelected(object sender, SelectionChangedEventArgs e)
        {
            if (e.CurrentSelection.FirstOrDefault() is Film selectedFilm)
            {
                await Navigation.PushAsync(new FilmDetailsPage(selectedFilm));
                // Deselect the item
                ((CollectionView)sender).SelectedItem = null;
            }
        }

        private async void OnSearchTextChanged(object sender, TextChangedEventArgs e)
        {
            var searchText = e.NewTextValue?.ToLower() ?? "";
            FilteredMovies.Clear();

            try
            {
                if (string.IsNullOrWhiteSpace(searchText))
                {
                    foreach (var film in AllMovies)
                    {
                        FilteredMovies.Add(film);
                    }
                }
                else
                {
                    var filteredFilms = await _tmdbService.SearchFilmsAsync(searchText);
                    foreach (var film in filteredFilms)
                    {
                        FilteredMovies.Add(film);
                    }
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"Search failed: {ex.Message}", "OK");
                Debug.WriteLine($"Search error: {ex}");
            }
        }
    }
}