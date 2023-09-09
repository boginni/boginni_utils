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
