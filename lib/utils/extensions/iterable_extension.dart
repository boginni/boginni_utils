part of 'package:boginni_utils/boginni_utils.dart';

// Extension methods for the `Iterable` class.
extension IterableExtensions<T> on Iterable<T> {

  // Returns the first element in the iterable that satisfies the provided test.
  // If no such element is found, it returns null.
  T? firstWhereOrNull(bool Function(T) test) {
    for (T element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }

  // Retrieves the next element in the array after the provided element.
  // If the provided element is the last in the list, it returns the first element, making the list behave like a circle.
  T nextInCircleArray(T element) {
    var list = toList();
    var currentIndex = list.indexOf(element);

    if (currentIndex == -1) {
      throw Exception('Element not found.');
    } else {
      var nextIndex = (currentIndex + 1) % list.length;
      return list[nextIndex];
    }
  }

  // Retrieves the next element in the array after the provided element.
  // If the provided element is the last in the list, it returns null.
  T? nextInLineArray(T element) {
    var list = toList();
    var currentIndex = list.indexOf(element);

    if (currentIndex == -1) {
      throw Exception('Element not found.');
    } else {
      var nextIndex = (currentIndex + 1);
      if (nextIndex >= list.length) {
        return null;
      }

      return list[nextIndex];
    }
  }

  @Deprecated('Use nextInCircleArray instead')
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

  @Deprecated('Use nextInCircleArray instead')
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
