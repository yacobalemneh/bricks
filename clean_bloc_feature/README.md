# clean_bloc_feature

Create features (`lib/features/`) and initial screen for projects created with clean_router_project.

## Variables

- **name**: Can be auth, settings, etc. (default: my_feature)
- **first_screen**: First screen in this feature, e.g., login, signup, etc. (default: my_screen)
- **bloc_type**: Create a bloc class or a cubit? Choose between "bloc" and "cubit" (default: bloc)

## Usage

This brick creates a new feature in the `lib/features/` directory, along with an initial screen for that feature.

### Generated File Structure

Assuming you chose auth as the feature name, login as the first screen, and bloc as the bloc type, the generated file structure would be:

```
features/
├── auth/
│ ├── core/
│ ├── login/
│ │ ├── data/
│ │ ├── domain/
│ │ ├── presentation/
│ │ │ ├── bloc/
│ │ │ ├── login.dart
│ │ │ ├── login_screen.dart
│ │ │ ├── route.dart
│ │ │ └── widgets/
│ │ └── ...
│ └── routes.dart
├── home/
└── routes.dart

```

The `lib/features/routes.dart` file will be updated to include the new feature route:

```dart
void registerAllRoutes(RouteManager routeManager) {
  registerHomeRoutes(routeManager);
  registerAuthRoutes(routeManager);
  // Register routes for other features here
}

```

The new feature directory (e.g., auth in this example) will contain a routes.dart file that lists the routes for the screens in the feature:

```dart
void registerAuthRoutes(RouteManager routeManager) {
  routeManager.registerRoute(
      path: '/auth',
      pageBuilder: (state) => AuthPageRoute(state),
    );
}
```

Each screen in the feature will have its own presentation folder containing the necessary files, including a route.dart file that defines the route for the screen:

```dart
class AuthPageRoute extends CustomPage {
  const AuthPageRoute(GoRouterState state)
      : super(key: const ValueKey('AuthPageRoute'), state: state);

  @override
  Route<dynamic> createRoute(BuildContext context) {
    return CupertinoPageRoute(
      fullscreenDialog: true,
      settings: this,
      builder: (context) => buildContent(context),
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return MaterialPage(
        child: BlocProvider(
        create: (context) => AuthBloc(),
        child: const AuthScreen(),
      ),
    );
  }
}
```

