using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using RateReel.Models;

namespace RateReel.Services
{
    public class TmdbService
    {
        private readonly HttpClient _httpClient;
        private const string ApiKey = "057f705441ffc6217091e135060edf27"; // TMDB API key
        private const string BaseUrl = "https://api.themoviedb.org/3/";

        public TmdbService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        

        public async Task<List<Film>> GetPopularFilmsAsync()
        {
            var response = await _httpClient.GetAsync($"{BaseUrl}movie/popular?api_key={ApiKey}&language=en-US&page=1");
            response.EnsureSuccessStatusCode();
            var json = await response.Content.ReadAsStringAsync();
            var result = JsonConvert.DeserializeObject<TmdbResponse>(json);
            return result?.Results ?? new List<Film>();
        }

        

        public async Task<List<Film>> SearchFilmsAsync(string query)
        {
            var response = await _httpClient.GetAsync($"{BaseUrl}search/movie?api_key={ApiKey}&language=en-US&query={Uri.EscapeDataString(query)}&page=1&include_adult=false");
            response.EnsureSuccessStatusCode();
            var json = await response.Content.ReadAsStringAsync();
            var result = JsonConvert.DeserializeObject<TmdbResponse>(json);
            return result?.Results ?? new List<Film>();
        }
        
    }

    public class TmdbResponse
    {
        [JsonProperty("results")]
        public List<Film> Results { get; set; }
    }
}