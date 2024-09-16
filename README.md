# Movie App - Swift UIKit VIPER Project

This project is a simple movie app built with Xcode and Swift using UIKit for the interface. The app follows the VIPER architecture and allows users to browse a list of popular movies fetched from an API and view detailed information about each movie.

## Features

- **Popular Movie List**: Displays a list of popular movies in a table view (UITableView). Each movie is shown within a cell that contains an image and title.
- **Movie Details**: Upon selecting a movie from the list, the user is navigated to a detail view that shows the movie's image and summary.
- **VIPER Architecture**: The app is structured using VIPER (View, Interactor, Presenter, Entity, Router), making the project modular and easy to maintain.
- **API Integration**: Movie data (images, titles, summaries) is fetched dynamically from an external API.

## Purpose of the Project

The goal of this project is to practice:

- **VIPER Architecture**: Modularize the app into distinct layers for better separation of concerns and code maintainability.
- **UIKit & UITableView**: Implement a scrollable list of movies using a UITableView where each movie is displayed inside a custom cell.
- **Networking**: Fetch movie data from an external API.
- **Navigation**: Navigate between views using a router, following VIPER architecture principles.

## How It Works

1. **Movie List**: The app starts with a view displaying popular movies in a table. The data is retrieved from an API and presented in a list.
2. **Movie Details**: Tapping on a movie in the list navigates the user to a detail view showing the selected movie's image and summary.
3. **API Integration**: The app uses a RESTful API to fetch the latest popular movies.

## VIPER Architecture Breakdown

- **View**: Displays the list of movies and details on user interaction.
- **Interactor**: Handles the business logic, such as fetching
