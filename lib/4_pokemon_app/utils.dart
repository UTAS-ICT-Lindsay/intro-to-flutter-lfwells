// an extension function on String to capitalize the first letter of a string
extension StringCasingExtension on String {
  String capitalize() {
    if (length > 0) {
      return '${this[0].toUpperCase()}${substring(1)}';
    } else {
      return '';
    }
  }
}