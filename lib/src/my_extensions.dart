extension StringExtension on String {
  bool get isBlank => isEmpty || trim().isEmpty;
  bool get isNotBlank => !isBlank;
}