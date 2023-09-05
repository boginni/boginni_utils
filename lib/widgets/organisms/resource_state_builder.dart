part of 'package:boginni_utils/boginni_utils.dart';


class ResourceStateBuilder<T> extends StatelessWidget {
  final ResourceState<T> resource;
  final Widget? childErro, childLoading, childEmpty, childWaiting;
  final Widget childDefault;
  final Widget Function(BuildContext context, T value) builder;
  final bool keepAlive, ignoreEmpty;

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
            return builder(context, resource.getData);
          case ResourceStateEnum.EMPTY_SUCCESS:
            if (ignoreEmpty && childEmpty == null) {
              return builder(context, resource.getData);
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
      child: childDefault,
    );
  }
}
