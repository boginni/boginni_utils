part of 'package:boginni_utils/boginni_utils.dart';

/// A StatelessWidget that helps in building UI based on different states of a resource.
/// This can be particularly useful in scenarios where the UI changes based on loading, error, success, or other states of a data fetch or operation.
class ResourceStateBuilder<T> extends StatelessWidget {
  /// Represents the current state of the resource.
  final ResourceState<T> resource;

  /// Customizable child widgets to display based on the different states.
  final Widget? child, childErro, childLoading, childEmpty, childWaiting;

  /// Default widget to show when none of the states match.
  final Widget childDefault;

  /// Function to build the UI for the 'SUCCESS' state. It provides the value of the resource.
  final Widget Function(BuildContext context, T value, Widget? child) builder;

  /// If the widget should remain in memory when off-screen.
  final bool keepAlive;

  /// If the widget should ignore the 'EMPTY_SUCCESS' state and use the provided builder function.
  final bool ignoreEmpty;

  const ResourceStateBuilder({
    super.key,
    required this.resource,
    required this.builder,
    this.childErro,
    this.childWaiting,
    this.childEmpty,
    this.childLoading,
    this.keepAlive = true,
    this.childDefault = const SizedBox.shrink(),
    this.ignoreEmpty = true,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: resource,
      builder: (context, child) {
        switch (resource.state) {
          case ResourceStateEnum.WAITING:
            return childWaiting ?? childDefault;
          case ResourceStateEnum.LOADING:
            return childLoading ??
                const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
          case ResourceStateEnum.SUCCESS:
            return builder(context, resource.getData, child);
          case ResourceStateEnum.EMPTY_SUCCESS:
            if (ignoreEmpty && childEmpty == null) {
              return builder(context, resource.getData, child);
            }

            return childEmpty ?? childDefault;
          case ResourceStateEnum.ERROR:
            return childErro ??
                Center(
                  child: Text("${resource.error}"),
                );
          default:
            return childDefault;
        }
      },
      child: child,
    );
  }
}
