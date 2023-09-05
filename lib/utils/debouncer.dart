part of 'package:boginni_utils/boginni_utils.dart';

/// A utility class to delay the execution of a function/callback.
///
/// The Debouncer helps to ensure that high-frequency events do not trigger
/// the function execution too frequently. The function will only be executed
/// once, after a specified duration has passed without any other invocation.
class Debouncer {
  /// The duration to wait before the callback is executed.
  final Duration delay;

  /// Internal timer to track the delay and execute the callback.
  Timer? _timer;

  /// Creates a new Debouncer instance.
  ///
  /// The [delay] parameter is required and represents the time to wait
  /// before executing the provided callback.
  Debouncer({required this.delay});

  /// Schedules the provided [callback] to run after the [delay] duration.
  ///
  /// If this method is called before the previous timer expires, the previous
  /// timer will be canceled, effectively restarting the delay countdown.
  ///
  /// Example:
  /// ```dart
  /// final debouncer = Debouncer(delay: Duration(milliseconds: 500));
  /// debouncer.run(() {
  ///   print("Executed after 500 milliseconds!");
  /// });
  /// ```
  ///
  /// [callback] is the function to be executed after the delay.
  void run(VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  /// Cancels any active timer, preventing the scheduled callback from being executed.
  ///
  /// Example:
  /// ```dart
  /// final debouncer = Debouncer(delay: Duration(milliseconds: 500));
  /// debouncer.run(() {
  ///   print("This will not be printed because of the cancel method.");
  /// });
  /// debouncer.cancel();  // This will prevent the callback from executing.
  /// ```
  void cancel() {
    _timer?.cancel();
  }
}
