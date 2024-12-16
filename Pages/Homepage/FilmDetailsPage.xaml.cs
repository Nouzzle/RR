using Microsoft.Maui.Controls;
using RateReel.Models;
using System;
using System.Linq;
using RateReel.Services;


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

        private readonly MongoDbService _mongoDbService = new MongoDbService();

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

    var newReview = new Review
    {
        Username = App.LoggedInUsername,
        MovieTitle = CurrentFilm.Title,
        Rating = rating,
        ReviewText = reviewText,
        PosterUrl = CurrentFilm.PosterUrl,
        ReviewDate = DateTime.Now
    };

    // Simpan ke MongoDB (Update atau Insert jika belum ada)
    var mongoDbService = new MongoDbService();
    await mongoDbService.SaveOrUpdateReviewAsync(newReview);

    // Update koleksi lokal App.Reviews
    var existingReview = App.Reviews.FirstOrDefault(r =>
        r.Username == newReview.Username && r.MovieTitle == newReview.MovieTitle);

    if (existingReview != null)
        App.Reviews.Remove(existingReview);

    App.Reviews.Add(newReview);

    await DisplayAlert("Success", "Your review has been submitted or updated.", "OK");

    // Reset UI
    RatingSlider.Value = 3;
    ReviewEditor.Text = string.Empty;

    // Kirim notifikasi untuk memperbarui tampilan profile
    MessagingCenter.Send(this, "UpdateCounts");
}


    }
}