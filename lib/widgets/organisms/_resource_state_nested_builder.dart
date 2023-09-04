import 'package:boginni_utils/utils/resource/_resource_state.dart';
import 'package:flutter/material.dart';

class MultiResourceStateBuilder extends StatelessWidget {
  final List<ResourceState> listenables;
  final Widget Function(BuildContext context) builder;

  const MultiResourceStateBuilder({
    super.key,
    required this.listenables,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        for (var listenable in listenables) {
          return ListenableBuilder(
            listenable: listenable,
            builder: (context, _) => builder(context),
          );
        }
        return builder(context);
      },
    );
  }
}
