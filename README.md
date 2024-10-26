# TempTrack Weather App ☀️🌧

TempTrack is a weather application that provides real-time weather updates based on user input. This app is designed to deliver an intuitive and visually engaging user experience while offering essential weather information.

## Features

- **Real-Time Weather Updates:** Get current weather data for any city by simply entering the city name.
- **Dynamic UI:** The app theme changes based on the weather condition, providing a visually responsive experience.
- **Weather Cards:**
  - **Main Weather Card:** Displays average temperature, humidity, cloudiness, and a weather condition image.
  - **Sub Weather Card:** Shows additional information such as sunrise, sunset, minimum, and maximum temperatures.
  - **Wind Card:** Includes an animated cloud image representing wind conditions using Lottie animations.
- **Search Functionality:** Users can search for weather information by city name.

## Tech Stack

- **Flutter**: The UI framework for building natively compiled applications.
- **Dart**: The programming language used for the app.
- **OpenWeatherMap API**: Provides real-time weather data.
- **dio**: For making HTTP requests to the OpenWeatherMap API.
- **flutter_bloc**: For state management using Cubit.
- **intl**: For formatting dates to enhance readability.
- **lottie**: For adding engaging custom animations to the app.

## Getting Started

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/temptrack.git
   cd temptrack

2. **Install dependencies:**

    ```bash
    flutter pub get

3. **Run the app:**

    ```bash
    flutter run

## Future Improvements

- Implement location-based weather fetching on app launch to provide a more seamless user experience.
- Add a 5-day weather forecast feature to help users plan ahead.
