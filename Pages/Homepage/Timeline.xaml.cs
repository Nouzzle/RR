using System;
using System.Collections.ObjectModel;
using Microsoft.Maui.Controls;
using RateReel.Models;


namespace RateReel.Pages.Homepage
{
    public partial class Timeline : ContentPage
    {
        public ObservableCollection<Review> Reviews => App.Reviews;

        public Timeline()
        {
            InitializeComponent();
            BindingContext = this;

            // Load sample reviews if the collection is empty
            if (App.Reviews.Count == 0)
            {
                LoadSampleReviews();
            }
        }

        private void LoadSampleReviews()
        {
            if (App.Reviews.Count == 0)
            {
                App.Reviews.Add(new Review
                {
                    Username = "YosaGanteng",
                    MovieTitle = "Inception",
                    Rating = 5.0,
                    ReviewText = "This film will blow your mind!",
                    PosterUrl = "inception.png",
                    ReviewDate = DateTime.Now.AddMinutes(-45)
                });

                App.Reviews.Add(new Review
                {
                    Username = "Syahrul",
                    MovieTitle = "Parasite",
                    Rating = 5.0,
                    ReviewText = "A masterpiece that makes me think deeply.",
                    PosterUrl = "parasite.png",
                    ReviewDate = DateTime.Now.AddMinutes(-30)
                });

                App.Reviews.Add(new Review
                {
                    Username = "Abdul Edi",
                    MovieTitle = "GodFather",
                    Rating = 5.0,
                    ReviewText = "The best movie ever!",
                    PosterUrl = "godfather.png",
                    ReviewDate = DateTime.Now.AddMinutes(-35)
                });

                App.Reviews.Add(new Review
                {
                    Username = "FAiz",
                    MovieTitle = "PoorThings",
                    Rating = 5.0,
                    ReviewText = "This film is so good",
                    PosterUrl = "poorthings.jpg",
                    ReviewDate = DateTime.Now.AddMinutes(-50)
                });
            }
        }
    }
}