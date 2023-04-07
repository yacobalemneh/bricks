
# clean_router_project

This brick creates a new Flutter project with clean architecture, go_router for navigation, and feature-based route management. It also sets up flavors and organizes your codebase into a maintainable structure. Check out the details below:

# 

[![License: MIT][license_badge]][license_link]

A new brick created with the Mason CLI that sets up a Flutter project with clean architecture, go_router, and feature-based route management

---

## Getting Started 🚀

This project is based on the clean architecture and uses the [go_router](https://pub.dev/packages/go_router) package for navigation. The codebase is organized into features, with each feature having its routes defined in a `routes.dart` file under `lib/features/my_feature`.

### Creating New Features and Screens

This brick comes with two additional bricks that help you create new features and screens easily:

1. **clean_bloc_feature**: Enables users to create new features in the `lib/features` directory.
2. **clean_bloc_route**: Automatically generates a new screen and adds the screen route for the feature in `lib/features/my_feature/routes.dart`.

### Project Structure

The project is organized into the following structure:

lib/
├── core/
├── features/
│   ├── home/
│   │   ├── data/
│   │   ├── domain/
│   │   ├── presentation/
│   │   │   ├── cubit/
│   │   │   ├── home.dart
│   │   │   ├── home_screen.dart
│   │   │   ├── route.dart
│   │   │   └── widgets/
│   │   └── routes.dart
│   └── ...
├── l10n/
├── presentation/
│   ├── app.dart
│   ├── routes.dart
│   └── theme/
│       ├── app_color.dart
│       └── theme_data.dart
├── main_development.dart
├── main_production.dart
├── main_staging.dart
└── ...



### Working with Routes

The project uses the [go_router](https://pub.dev/packages/go_router) package for navigation. 
Each feature is stored in its own directory within `lib/features`. Inside each feature directory, you'll find the screens and the `routes.dart` file that contains the routes for that feature. All feature routes are combined in the `lib/features/routes.dart` file:

```dart
final List<GoRoute> featureRoutes = [
  ...homeRoutes,
  ...authRoutes,
  ...gameRoutes,
  // Add new feature routes here
];
```

When adding a new feature, update the featureRoutes list with the new feature's routes (as shown above).
If you use the **clean_bloc_feature** brick the featuresRoutes list will be automatically updated for you.


Inside each feature directory `lib/features/auth`, you'll find the screens and the `routes.dart` file that contains the routes for that feature.
When creating a new screen:

```dart
final loginScreenRoute = GoRoute(
  path: 'auth/login',
  pageBuilder: (context, state) {
    return MaterialPage(
      child: BlocProvider(
        create: (context) => LoginBloc(),
        child: const LoginScreen(),
      ),
    );
  },
);

final List<GoRoute> authRoutes = [
  signupScreenRoute, 
  loginScreenRoute, 
];

```

Update the the `routes.dart` file for the feature, in the case of the above `lib/features/auth/routes.dart file` by adding it to the authRoutes list if 
you have the routes file or to the `lib/features/routes.dart` if you don't.
If you use the **clean_bloc_route** brick the everything will be automatically updated for you.



### Flavors

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*{{project_name.titleCase()}} works on iOS, Android, Web, and Windows._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:{{project_name.snakeCase()}}/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis