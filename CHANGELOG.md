## 0.0.1

* TODO: Describe initial release.

## 0.1.0

### Enhancements:
* Added getter for all possible states in ResourceState
```dart
  bool get isWaiting => _state == ResourceStateEnum.WAITING;
  bool get isLoading => _state == ResourceStateEnum.LOADING;
  bool get isSuccess => _state == ResourceStateEnum.SUCCESS;
  bool get isEmptySuccess => _state == ResourceStateEnum.EMPTY_SUCCESS;
  bool get isError => _state == ResourceStateEnum.ERROR;
```
* Implemented new Functions for IterableExtension:
```dart
  T? nextInLineOrNull(T element);
  T nextInLine(T element);
```

## [0.2.0] - 2023-09-11
### ⚠️ Breaking Changes:
* **ResourceStateBuilder**: Adjusted the build function to take 3 positional parameters instead of 2. Users will need to update any calls to this function to pass the correct number of arguments.

### Deprecations:
* Deprecated `nextInLine` method in `IterableExtension`. **Recommended alternative**: Use `nextInCircleArray` instead.
* Deprecated `nextInLineOrNull` method in `IterableExtension`. **Recommended alternative**: Use `nextInCircleArray` instead.

### Enhancements:
* Introduced child support for `resource_state_builder`.
* Refined internal logic of `resource_state` for better performance and accuracy.
* Expanded IterableExtension with new utility methods:
```dart
  T? nextInCircleArray(T element);
  T nextInLineArray(T element);
```