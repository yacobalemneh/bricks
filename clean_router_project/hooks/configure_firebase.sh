#!/bin/bash

# Ensure the correct number of arguments are provided
if [ "$#" -ne 4 ]; then
    echo "Usage: configure_firebase.sh project_directory firebase_project env bundle_id"
    exit 1
fi

# Set the provided arguments as variables
project_directory="$1"
firebase_project="$2"
env="$3"
bundle_id="$4"

# Change the working directory to the provided project_directory
cd "$project_directory" || exit 1

# Run the flutterfire CLI with the necessary parameters
flutterfire config \
  --project "$firebase_project" \
  --out "lib/firebase_config/firebase_options_$env.dart" \
  --ios-bundle-id "$bundle_id.$env" \
  --macos-bundle-id "$bundle_id.$env" \
  --android-app-id "$(if [ "$env" = "prod" ]; then echo "$bundle_id"; else echo "$bundle_id.$env"; fi)"

# Exit with the exit code of the last command
exit $?