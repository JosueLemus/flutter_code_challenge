

# Blog Posts App

This project is a Flutter-based application designed to display a blog-style page with posts and contributors. It uses the [jsonplaceholder API](https://jsonplaceholder.typicode.com/) to fetch data.

---

## Features

### 1. **Blog Posts Page**

The Blog Posts page provides a seamless and visually appealing way to display blog posts fetched from the JSONPlaceholder API (`https://jsonplaceholder.typicode.com/posts`). The key features of this page include:

- **Dynamic Loading with Infinite Scroll:** Posts are loaded dynamically as the user scrolls, creating a smooth browsing experience without the need for explicit page navigation.
- **Pull-to-Refresh Support:** Users can refresh the list of posts by pulling down from the top, ensuring they always have the latest data.
- **Responsive Design:** 
  - On **iPhone (vertical)**, the posts are displayed in a single-column layout for better readability.  
    ![iPhone Vertical View](https://github.com/user-attachments/assets/45dec839-bc40-435c-9ee2-6965f4bb3bf5)
  - On **iPhone (horizontal)**, the layout adapts to utilize the wider space efficiently.  
    ![iPhone Horizontal View](https://github.com/user-attachments/assets/cbcd6338-3d94-46f6-b788-fd35c7f96043)
  - On **iPad**, the grid layout adjusts to show multiple columns, making full use of the larger screen size while maintaining readability and spacing.  
    ![iPad View](https://github.com/user-attachments/assets/dce3848a-a370-4292-bdfa-46fd9726ce23)

This implementation ensures a responsive and user-friendly experience across all devices.


### 2. **Contributors Page**
- Displays a list of contributors fetched from `https://jsonplaceholder.typicode.com/users`.
- Includes a pull-to-refresh feature.
- Each contributor item is tappable to display a detailed view in a bottom sheet.
- The list layout adapts for tablets and smaller screens, centering the content with a max width.

#### Demo Videos:
1. **Contributors List:** Demonstrates the pull-to-refresh feature and the responsive layout on iPhone and iPad. 
 


   ![Contributors List](https://github.com/user-attachments/assets/787ac5f7-7818-4331-83c0-20a1d625e131)

   
2. **Contributor Details View:** Showcases the detailed bottom sheet view of a contributor on iPhone and iPad.  


   ![Contributor Details](https://github.com/user-attachments/assets/eac6500c-8c2d-442b-b2fb-fe08020595c0)






### 3. **Tab Bar Navigation**
- Features a tab bar at the top with two tabs:
  - Posts: Displays the list of blog posts.
  - Contributors: Displays the list of contributors.
- The tab bar remains fixed at the top while scrolling, displacing the title and subtitle.

### 4. **Light and Dark Themes**
- The app supports both light and dark themes.
- Automatically adapts the UI based on the device's theme settings.

#### Demo:
The video below demonstrates the app's light and dark themes on Android and iOS devices.  

![Light and Dark Themes](https://github.com/user-attachments/assets/2e51733f-81bc-4afe-86f2-d0c2c099c252)


### 5. **Unit and Widget Tests**
- Unit tests for repository logic to ensure proper API integration.
- Widget tests for validating the UI components like `PostWidget` and contributors list behavior.


---

## Libraries Used

### 1. **[http](https://pub.dev/packages/http)**
- **Purpose**: To make HTTP requests and fetch data from the API.

### 2. **[flutter_bloc](https://pub.dev/packages/flutter_bloc)**
- **Purpose**: State management using the BLoC pattern for handling business logic and UI state.

### 3. **[oxidized](https://pub.dev/packages/oxidized)**
- **Purpose**: Provides a functional way to handle errors and results, inspired by Rust's `Result` and `Option`.

### 4. **[equatable](https://pub.dev/packages/equatable)**
- **Purpose**: Simplifies equality comparisons for Dart objects, especially useful for state classes in BLoC.

### 5. **[bloc](https://pub.dev/packages/bloc)**
- **Purpose**: Core library for implementing the BLoC pattern.

### 6. **[get_it](https://pub.dev/packages/get_it)**
- **Purpose**: Service locator for managing dependencies like repositories and data sources.

### 7. **[mocktail](https://pub.dev/packages/mocktail)**
- **Purpose**: Used for mocking dependencies in tests, particularly for unit testing the repositories.

---

## Project Highlights

- Built with **Flutter 3.24** and **Dart 3.5**.
- Organized using **Clean Architecture** principles, separating the domain, data, and presentation layers.
- Responsive and adaptive UI for all screen sizes.
- Implements **BLoC 8.1.4** for scalable and testable state management.
- Comprehensive testing ensures app reliability.
- File and folder organization enhances maintainability.

---

## Running the Project

1. Install Flutter 3.24 and Dart 3.5.
2. Clone the repository and run `flutter pub get` to fetch dependencies.
3. Start the app using:
   ```bash
   flutter run

### Running Unit Tests

To execute all tests, run the following command:
  ```bash
  flutter test
```

If you want to run a specific test file, use:
nd:
  ```bash
  flutter test test/<file_name>.dart
```

