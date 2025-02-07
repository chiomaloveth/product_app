# Flutter E-Commerce App with Provider and GoRouter

This is a Flutter e-commerce app that demonstrates the use of **Provider** for state management and **GoRouter** for navigation. The app includes features like product listing, product details, user authentication, and a bottom navigation bar.

---

## Features

- **State Management**: Uses the `Provider` package to manage app state, including product data and user authentication.
- **Navigation**: Uses `GoRouter` for declarative routing and navigation.
- **Responsive UI**: Adapts to different screen sizes and orientations.
- **Product Listing**: Displays a grid of products with images, names, descriptions, and prices.
- **Product Details**: Clicking on a product navigates to a details page with more information.
- **User Authentication**: Demonstrates how to use `AuthProvider` to manage user login state.

---

## Screenshots

| Home Screen | Product Details |
|-------------|-----------------|
| ![Home Screen](screenshots/home.png) | ![Product Details](screenshots/product_details.png) |

---

## Getting Started

### Prerequisites

- Flutter SDK installed on your machine.
- An IDE like Android Studio or VS Code with the Flutter plugin installed.

### Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/your-username/flutter-ecommerce-app.git
   cd flutter-ecommerce-app
   ```

2. **Install Dependencies**

   Run the following command to install the required packages:

   ```bash
   flutter pub get
   ```

3. **Run the App**

   Connect a device or start an emulator, then run:

   ```bash
   flutter run
   ```

---

## Packages Used

The app uses the following Flutter packages:

- **[Provider](https://pub.dev/packages/provider)**: For state management.
- **[GoRouter](https://pub.dev/packages/go_router)**: For declarative routing and navigation.
- **[Flutter Launcher Icons](https://pub.dev/packages/flutter_launcher_icons)**: For generating app icons.

To install these packages, add them to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0
  go_router: ^6.0.0
  flutter_launcher_icons: ^0.11.0
```

Then run:

```bash
flutter pub get
```

---




## Contributing

Contributions are welcome! If you find a bug or want to add a feature, please open an issue or submit a pull request.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

- [Flutter](https://flutter.dev) for the awesome framework.
- [Provider](https://pub.dev/packages/provider) for state management.
- [GoRouter](https://pub.dev/packages/go_router) for navigation.

---

Happy coding! 🚀
