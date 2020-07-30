import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ReusableCustomScrollView extends HookWidget {
  final Key key;
  final List<Widget> slivers;
  final ScrollController controller;

  ReusableCustomScrollView({
    this.slivers,
    @required this.controller,
    @required this.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: key,
      slivers: slivers,
      controller: controller,
    );
  }
}
