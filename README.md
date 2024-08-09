# Sample Chat App

A simple chat application built with Flutter and Firebase. This app features user authentication, real-time messaging, and theme switching between light and dark modes.

## Features

* **User Authentication:** Sign up, log in, and log out functionalities.
* **Real-Time Messaging:** Send and receive messages instantly.
* **Theme Switching:** Toggle between light and dark modes.
* **Responsive Design:** Optimized for various screen sizes.

## Getting Started

Prerequisites

* **Flutter SDK:** Ensure you have Flutter installed. Follow the Flutter installation guide.
* **Firebase Account:** Create a Firebase project at Firebase Console.

## Setup

* Clone the Repository

```
git clone https://github.com/v-eenay/Flutter-Chat-Starter.git
cd sample_chat_app
```

* Install Dependencies

  Navigate to the project directory and run:

```
flutter pub get
```

* Setup Firebase
* Go to Firebase Console and create a new project.
* Register your app with Firebase:

  * For Android: Download the google-services.json file and place it in the android/app directory.
    . For iOS: Download the GoogleService-Info.plist file and place it in the ios/Runner directory.
* Enable the following Firebase services:
* Authentication: Enable Email/Password authentication.
* Firestore: Create a new Firestore database.

## Configure Firebase

* Add Firebase SDK to your app:
  * For Android: Update android/build.gradle and android/app/build.gradle files as specified in the Firebase setup instructions.
  * For iOS: Update the ios/Podfile and run pod install as specified in the Firebase setup instructions.

# Run the App

* To run the app, use:

```
flutter run
```

* Ensure your emulator or device is connected.

## Development

### Code Structure

* **lib/:** Contains the main codebase.
* **models/:** Contains data models like message.dart.
* **screens/:** Contains UI screens like login_screen.dart and chat_screen.dart.
* **services/:** Contains service classes for Firebase operations like auth_service.dart and chat_service.dart.
* **themes/:** Contains theme configurations like dark_mode.dart and light_mode.dart.
* **main.dart:** Entry point of the app.
* **Adding Features**
  * **User Authentication:** Use auth_service.dart to handle authentication logic.
  * **Messaging:** Implement messaging features in chat_service.dart and chat_screen.dart.
  * **Theming:** Toggle themes using theme_provider.dart and dark_mode.dart / light_mode.dart.

## Testing

* Run unit and widget tests using:

```
flutter test
```

## Contribution

* For suggestions or contributions, please reach out to me via email: koiralavinay@gmail.com.
