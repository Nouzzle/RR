﻿using Microsoft.Extensions.DependencyInjection;
using System.Collections.ObjectModel;
using RateReel.Models;
using RateReel.Services;
using System;
using System.IO;
using System.Net.Http;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RateReel
{
    public partial class App : Application
    {

       // static DatabaseService database;
       
      // static FileService fileService;

        public static IServiceProvider ServiceProvider { get; private set; }
        public static string LoggedInUsername { get; set; } = string.Empty;

        public static ObservableCollection<Review> Reviews { get; set; } = new ObservableCollection<Review>();

        
//          public static FileService FileService
//         {
//            get
//             {
//                 if (fileService == null)
//                 {
// #if DEBUG
//                     // Development path - update this to your actual project path
//                     var projectDirectory = "/Users/vinn/Desktop/RateReel/Database-list";
// #else
//                     // Production path
//                     var projectDirectory = Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData);
// #endif
//                     var folderPath = Path.Combine(projectDirectory, "DatabaseUser");
//                     Directory.CreateDirectory(folderPath); // Ensure the directory exists
//                     var filePath = Path.Combine(folderPath, "usersaved.txt");
//                     Console.WriteLine($"File path: {filePath}"); // Debugging output
//                     fileService = new FileService(filePath);
//                 }
//                 return fileService;
//             }
//         }

        public App()
        {
            InitializeComponent();

            var services = new ServiceCollection();
            ConfigureServices(services);
            ServiceProvider = services.BuildServiceProvider();

            MainPage = new AppShell();
        }

public static void ResetAppState()
{
    LoggedInUsername = string.Empty;
   
}

public static async Task LoadReviewsAsync(MongoDbService mongoService)
{
    try
    {
        var allReviews = await mongoService.GetAllReviewsAsync();
        App.Reviews.Clear();
        foreach (var review in allReviews)
        {
            App.Reviews.Add(review);
        }
        System.Diagnostics.Debug.WriteLine($"Loaded {App.Reviews.Count} reviews.");
    }
    catch (Exception ex)
    {
        System.Diagnostics.Debug.WriteLine($"Error loading reviews: {ex.Message}");
    }
}






        private void ConfigureServices(IServiceCollection services)
        {
            services.AddSingleton(new HttpClient());
            services.AddSingleton<TmdbService>();
        }
    }
}