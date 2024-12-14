using Microsoft.Maui.Controls;
using RateReel.Models;
using System;
using System.Linq;

namespace RateReel.Pages.Homepage
{
    public partial class FilmDetailsPage : ContentPage
    {
        private Film CurrentFilm;

        public FilmDetailsPage(Film film)
        {
            InitializeComponent();
            LoadFilmDetails(film);
            CurrentFilm = film;
        }

        private void LoadFilmDetails(Film film)
        {
            PosterImage.Source = film.PosterUrl;
            TitleLabel.Text = film.Title;
            YearLabel.Text = $"Year: {film.Year}";
            RatingLabel.Text = $"Rating: {film.Rating}";
            DescriptionLabel.Text = film.Description;
        }

        private async void OnSubmitReviewClicked(object sender, EventArgs e)
        {
            var rating = Math.Round(RatingSlider.Value, 1);
            var reviewText = ReviewEditor.Text?.Trim();

            if (string.IsNullOrEmpty(reviewText))
            {
                await DisplayAlert("Error", "Please enter a review.", "OK");
                return;
            }

            if (string.IsNullOrEmpty(App.LoggedInUsername))
            {
                await DisplayAlert("Error", "You must be logged in to submit a review.", "OK");
                return;
            }

            var existingReview = App.Reviews.FirstOrDefault(r => r.Username == App.LoggedInUsername && r.MovieTitle == CurrentFilm.Title);

            if (existingReview != null)
            {
                // Update the existing review
                existingReview.Rating = rating;
                existingReview.ReviewText = reviewText;
                existingReview.PosterUrl = CurrentFilm.PosterUrl;
                existingReview.ReviewDate = DateTime.Now;

                await DisplayAlert("Success", "Your review has been updated.", "OK");
            }
            else
            {
                // Add a new review
                var newReview = new Review
                {
                    Username = App.LoggedInUsername,
                    MovieTitle = CurrentFilm.Title,
                    Rating = rating,
                    ReviewText = reviewText,
                    PosterUrl = CurrentFilm.PosterUrl,
                    ReviewDate = DateTime.Now
                };

                App.Reviews.Add(newReview);

                await DisplayAlert("Success", "Your review has been submitted.", "OK");
            }

            // Notify the Account page to update counts
            MessagingCenter.Send(this, "UpdateCounts");

            // Clear input fields
            RatingSlider.Value = 3;
            ReviewEditor.Text = string.Empty;
        }
    }
}