using System;
using System.Collections.ObjectModel;
using Microsoft.Maui.Controls;
using RateReel.Models;
using RateReel.Services;
using System.Diagnostics;
using System.Linq;
using Microsoft.Extensions.DependencyInjection;

namespace RateReel.Pages.Homepage
{
    public partial class Films : ContentPage
    {
        public ObservableCollection<Film> AllMovies { get; set; }
        public ObservableCollection<Film> FilteredMovies { get; set; }

        public ObservableCollection<Review> Reviews => App.Reviews;

        private readonly TmdbService _tmdbService;

        public Films()
        {
            InitializeComponent();
            AllMovies = new ObservableCollection<Film>();
            FilteredMovies = new ObservableCollection<Film>();

            // Retrieve TmdbService 
            _tmdbService = App.ServiceProvider.GetService<TmdbService>();

            BindingContext = this;
            FilmsCollectionView.ItemsSource = FilteredMovies;

            // Fetch films on initialization
            FetchFilmsAsync();
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

                private async void OnSearchBarTextChanged(object sender, TextChangedEventArgs e)
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

        private async void OnFilmSelected(object sender, SelectionChangedEventArgs e)
        {
            if (e.CurrentSelection.FirstOrDefault() is Film selectedFilm)
            {
                await Navigation.PushAsync(new FilmDetailsPage(selectedFilm));
                
                ((CollectionView)sender).SelectedItem = null;
            }
        }
    }
}