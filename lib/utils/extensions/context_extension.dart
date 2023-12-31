part of 'package:boginni_utils/boginni_utils.dart';

extension ContextExtensions on BuildContext {
  // Fetch ColorScheme from the current theme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // Fetch TextTheme from the current theme
  TextTheme get textTheme => Theme.of(this).textTheme;
}
