extension StringExtension on String {
  // Add your string extensions here
  // Example implementation:
    String capitalize() {
    if (isEmpty) {
      return this;
    }

    return this[0].toUpperCase() + substring(1);
  }
}
