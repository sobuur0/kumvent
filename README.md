# kumvent

An Event Booking application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


**It is advisable to use Android Studio as your preferred IDE**


## Guidelines

### Naming Convention
| For files and directories       | For class names     | For variables & functions (or methods) |
|--------------|-----------|------------|
| user_data.dart :white_check_mark: | user_data.dart :x:     | user_data.dart :x:        |
| userData.dart :x:     | userData.dart :x: | userData.dart :white_check_mark:    |
| UserData.dart :x:   | UserData.dart :white_check_mark: | UserData.dart :x: |
| Loginview.dart :x:     | Loginview.dart :x: | Loginview.dart :x:  |
| Login_View.dart :x:    | Login_View.dart :x: | Login_View.dart :x:  |




NB: To make a variable or function private precede said variable or function with an underscore


```dart
String _myFancyVariable = "SomethingSomething";

void _myFancyFunction() {}
```

- For static constants

Start the const name with a "k" followed by the intended name, as below.

```dart
const Color kPrimaryColor = Colors.green;
```

### Project Structure

**constants**

This is useful for storing static variables across the app.

- **colours:** Colours values used throughout the app are stored here.
- **helper_functions:** Extension functions and other utilities that do not exactly fit into a class
- **route_constants:** Constant variables to store the route names of `pages` or `screens`.
- 

**presentation**

User-facing part of the app, this directory will contain all things user interface

- **animations:** `dir` for all app  animations.
- **pages:** This directory will contain the actual layout of the UI for the entire application.
- **widgets:** Directory for reusable & customizable UI components.


**Note: Other project structure to be added as the app progresses
