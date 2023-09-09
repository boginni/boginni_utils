part of 'package:boginni_utils/boginni_utils.dart';

extension IterableExtensions<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (T element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }

  T nextInLine(T element) {
    var list = toList();
    var currentIndex = list.indexOf(element);

    if (currentIndex == -1) {
      throw Exception();  // Element not found.
    } else {
      var nextIndex = (currentIndex + 1) % list.length;  // Use modulo for wrap-around.
      return list[nextIndex];
    }
  }

  T? nextInLineOrNull(T element) {
    var list = toList();
    var currentIndex = list.indexOf(element);

    if (currentIndex == -1) {
      return null;  // Element not found.
    } else {
      var nextIndex = (currentIndex + 1) % list.length;  // Use modulo for wrap-around.
      return list[nextIndex];
    }
  }
}
