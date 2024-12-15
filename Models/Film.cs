using Newtonsoft.Json;

namespace RateReel.Models
{
    public class Film
    {
        [JsonProperty("title")]
        public string Title { get; set; }

        [JsonProperty("poster_path")]
        public string PosterPath { get; set; }

        [JsonProperty("vote_average")]
        public double VoteAverage { get; set; }

        [JsonProperty("release_date")]
        public string ReleaseDate { get; set; }

        [JsonProperty("overview")]
        public string Description { get; set; }

        //  TMDB data
        public string PosterUrl => $"https://image.tmdb.org/t/p/w500{PosterPath}";
        public string Rating => $"{VoteAverage}/10";
        public string Year => ReleaseDate?.Split('-')[0];
    }
}