# Flutter Movie Search App

This Flutter application allows users to search for movies using the TMDB API and view details about each movie. Additionally, users can mark movies as favorites for easy access later.

## Screenshots

| (1)                                                                                                                         | (2)                                                                                                                         | (3)                                                                                                                   |
| ------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| <img src="[https://raw.githubusercontent.com/mohamed296/tmdb_movies/main/assets/1.jpeg](" alt="1" width="100"> | <img src="[https://raw.githubusercontent.com/mohamed296/tmdb_movies/main/assets/2.jpeg]" alt="2" width="100"> | <img src="[https://raw.githubusercontent.com/mohamed296/tmdb_movies/main/assets/3.jpeg]" alt="1" width="100">                                                                                                  |



## Features

- Cross-platform compatibility (Android)
- Search for movies using TMDB API
- View movie details including poster, title, overview, and cast
- Add and view favorite movies
- Responsive design for different screen sizes

## Getting Started

Follow these instructions to build and run the app:

### Prerequisites

- Flutter SDK installed
- Android device/emulator

### Installation

1. Clone the repository:

```
git clone https://github.com/your_username/flutter_movie_search_app.git
```

2. Navigate to the project directory:

```
cd flutter_movie_search_app
```

3. Install dependencies:

```
flutter pub get
```

### Configuration

1. Obtain an API key from TMDB by signing up on their website: [TMDB API](https://www.themoviedb.org/documentation/api)

2. Replace the `YOUR_API_KEY` placeholder in `lib/utils/constants.dart` with your actual TMDB API key:

```dart
const String TMDB_API_KEY = 'YOUR_API_KEY';
```

### Running the App

1. Connect your Android device or start an Android emulator.

2. Run the app:

```
flutter run
```

## Usage

1. **Search Screen**: Enter a movie title in the search field and press Enter. The app will display a grid of search results. Click on a movie to view its details.

2. **Movie Details Screen**: Displays detailed information about the selected movie, including the poster, title, overview, and cast.

3. **Favorites Screen**: View a list of your favorite movies. Click on a movie to view its details.

## Contributing

Contributions are welcome! If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to TMDB for providing the API.
- This project was inspired by the Flutter development community.
