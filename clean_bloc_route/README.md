# clean_bloc_route

Generates new screens with bloc and routes using go router, it automatically updates the routes if you use clean_router_project to create your project.


## Description

This brick helps you generate new screens within a feature, set up the required BLoC or Cubit components, and automatically add the screen's route to the feature's `routes.dart` file.

## Variables

- **feature_name**: The name of the feature this screen belongs to (e.g., auth, settings)
- **name**: The name of the new screen (e.g., login, signup)
- **bloc_type**: Choose between "bloc" and "cubit" for the state management
- **add_route**: Automatically add the screen route to your feature routes (feature/routes.dart)

## Usage

This brick adds a new screen to the specified feature. For example, if the user inputs "auth" for the feature and "signup" for the new screen, a new screen in `features/auth/signup/` will be created. It will have the same structure as the login screen. The brick also adds the new screen route to the `auth/routes.dart` file.
