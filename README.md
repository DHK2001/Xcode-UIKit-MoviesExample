# Movie App - Swift UIKit VIPER Project

This project is a simple movie app built with Xcode and Swift using UIKit for the interface. The app follows the VIPER architecture, allowing users to browse a list of popular movies fetched from an API and view detailed information about each movie.

## Features

- **Popular Movie List**: Displays a list of popular movies in a table view (UITableView). Each movie is shown within a cell that contains an image and title.
- **Movie Details**: Upon selecting a movie from the list, the user is navigated to a detail view that shows the movie's image and summary.
- **VIPER Architecture**: The app is structured using VIPER (View, Interactor, Presenter, Entity, Router), making the project modular and maintainable.
- **API Integration**: Movie data (images, titles, summaries) is fetched dynamically from an external API.

## Purpose of the Project

The goal of this project is to practice:

- **VIPER Architecture**: Modularize the app into distinct layers for better separation of concerns and maintainability.
- **UIKit & UITableView**: Implement a scrollable list of movies using a `UITableView` where each movie is displayed inside a custom cell.
- **Networking**: Fetch movie data from an external API.
- **Navigation**: Navigate between views using a router, following VIPER architecture principles.

## How It Works

1. **Movie List**: The app starts with a view displaying popular movies in a table. The data is retrieved from an API and presented in a list.
2. **Movie Details**: Tapping on a movie in the list navigates the user to a detail view showing the selected movie's image and summary.
3. **API Integration**: The app uses a RESTful API to fetch the latest popular movies dynamically.

## VIPER Architecture Breakdown

The project is organized into two main modules: **ListMovies** and **DetailMovies**, each of which follows the VIPER structure.

### ListMovies Module
- **View**: Displays the list of popular movies in a `UITableView`.
- **Presenter**: Handles the logic and interaction between the View and Interactor for the movie list.
- **Interactor**: Fetches the list of popular movies from the API.
- **Entities**: Represents the movie data (title, image, summary, etc.).
- **Router**: Manages navigation from the list view to the detail view when a movie is selected.

### DetailMovies Module
- **View**: Displays the details of the selected movie, including its image and summary.
- **Presenter**: Handles logic and updates the detail view with data received from the Interactor.
- **Interactor**: Fetches detailed information for a specific movie from the API.
- **Entities**: Represents detailed information about a movie.
- **Router**: Manages navigation from the detail view back to the list or other views.

## Folder Structure

The project is divided into two main folders for each module:

1. **ListMovies**: Contains the View, Presenter, Interactor, Entities, and Router for the movie list functionality.
2. **DetailMovies**: Contains the View, Presenter, Interactor, Entities, and Router for displaying detailed information about each movie.

## API Integration

The movie data is fetched from an external API that provides:

- Movie titles
- Movie images
- Movie summaries and details

## Conclusion

This project demonstrates the usage of VIPER architecture to build a scalable and modular movie app using Swift and UIKit. It showcases how to structure an app with clearly defined layers, handle network requests, display data using `UITableView`, and manage view navigation.
