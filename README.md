# TokTik App

## Summary

**Video App** is a mobile application built with Flutter that allows users to explore, view, and interact with videos fetched dynamically from the [Pexels API](https://www.pexels.com/api/). The app provides an engaging experience with animations, real-time data updates, and user-friendly features, all wrapped in a modern and visually appealing interface.

<p align="center">
  <img src="https://via.placeholder.com/200" alt="app-evidence" width="200"/>
</p>  

## Features

Key features of the project include:

- **Video playback** with controls (play, pause, seek) using the `video_player` package.
- **Animations** to enhance user experience, powered by the `animate_do` package.
- **Dynamic content** fetched from the Pexels API, including video titles, previews, and playback.
- **State management** with the `provider` package for smooth and scalable app architecture.
- **Environment variable support** for secure API key management using `flutter_dotenv`.
- **Date and time formatting** with the `intl` package to provide localized content display.

## Framework

This project was developed using the [Flutter](https://flutter.dev/) framework.

Key libraries and tools used:
- `video_player`: For video playback functionality.
- `animate_do`: For implementing animations.
- `provider`: For state management.
- `flutter_dotenv`: For secure environment variable management.
- `intl`: For internationalization and date/time formatting.

## Development setup

Follow these steps to set up and run the project:

1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/video_app.git
    ```

2. Navigate to the project directory:
    ```bash
    cd video_app
    ```

3. Create environment variables:
   - Copy the `.env` and `.env.prod` example files provided in the repository:

    ```bash
    cp .env.example .env
    cp .env.example .env.prod
    ```

   - Edit the `.env` file to include your API key and URL:
    ```bash
    API_KEY=YourApiKey
    API_URL=https://api.pexels.com/videos/
    ```

4. Install dependencies:
    ```bash
    flutter pub get
    ```

5. Run the app on an emulator or connected device:
    ```bash
    flutter run
    ```

The app will automatically reload if you make changes to the source files.

## YAML Configuration

Ensure the following dependencies are included in the `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  video_player: ^2.5.0
  animate_do: ^2.1.0
  provider: ^6.0.5
  flutter_dotenv: ^5.0.2
  intl: ^0.18.0

flutter:
  uses-material-design: true
  assets:
  - .env
```

## Building the app  

To build the project for release, run the following command:
```bash
  flutter build apk
```

This will generate the APK file for Android. For iOS, you can use:
```bash
  flutter build ios
```

## Contribute to this project

You can contribute to this project by submitting issues or pull requests in the [GitHub repository](https://github.com/GonzaloQu3dena/toktik_app). We welcome new ideas, features, and improvements!
