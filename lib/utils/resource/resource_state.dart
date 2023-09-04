import 'package:flutter/foundation.dart';
import 'resource_state_enum.dart';

class ResourceState<S> extends ChangeNotifier {
  S? data;
  Exception? error;
  ResourceStateEnum _state;

  ResourceStateEnum get state => _state;

  S get getData => data!;

  ResourceState({
    required this.data,
    required ResourceStateEnum state,
    this.error,
  }) : _state = state;

  factory ResourceState.loading() {
    return ResourceState(
      state: ResourceStateEnum.LOADING,
      data: null,
      error: null,
    );
  }

  factory ResourceState.success(S data) {
    return ResourceState(
      state: ResourceStateEnum.SUCCESS,
      data: data,
      error: null,
    );
  }

  factory ResourceState.emptySuccess() {
    return ResourceState(
      state: ResourceStateEnum.EMPTY_SUCCESS,
      data: null,
      error: null,
    );
  }

  factory ResourceState.error(Exception error) {
    return ResourceState(
      state: ResourceStateEnum.ERROR,
      error: error,
      data: null,
    );
  }

  factory ResourceState.waiting() {
    return ResourceState(
      state: ResourceStateEnum.WAITING,
      error: null,
      data: null,
    );
  }

  bool get isWaiting => _state == ResourceStateEnum.WAITING;

  void setState(
      {S? data,
      ResourceStateEnum state = ResourceStateEnum.SUCCESS,
      Exception? error,
      bool notify = true}) {
    _state = state;
    this.data = data;
    this.error = error;
    if (notify) {
      notifyListeners();
    }
  }

  void add(S data, {bool notify = true}) {
    var newState = ResourceStateEnum.SUCCESS;

    if (data is List) {
      if (data.isEmpty) {
        newState = ResourceStateEnum.EMPTY_SUCCESS;
      }
    } else {
      if (data == null) {
        newState = ResourceStateEnum.EMPTY_SUCCESS;
      }
    }

    _state = newState;
    this.data = data;
    this.error = null;
    if (notify) {
      notifyListeners();
    }
  }

  void setError({
    Exception? error,
    ResourceStateEnum state = ResourceStateEnum.ERROR,
    bool notify = true,
  }) {
    setState(state: state, error: error, notify: notify);
  }

  void setLoading({
    bool notify = true,
  }) {
    _state = ResourceStateEnum.LOADING;

    if (notify) {
      notifyListeners();
    }
  }

  Future<void> load(Future<S> future) async {
    setLoading();
    add(await future);
  }

  ResourceStateEnum? _lastState;

  void beginWaiting() {
    _lastState = _state;
    _state = ResourceStateEnum.WAITING;
    notifyListeners();
  }

  void finishWaiting() {
    if (_lastState == null) {
      return;
    }
    _state = _lastState!;
    notifyListeners();
  }
}
