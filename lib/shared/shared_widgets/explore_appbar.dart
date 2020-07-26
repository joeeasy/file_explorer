import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final Color backgroundColor;
  final double elevation;
  final Widget title;
  final Widget leading;
  final List<Widget> actions;
  final Brightness brightness;
  final bool centerTitle;
  final bool pinned;

  BaseAppBar({
    this.appBar,
    this.backgroundColor,
    this.elevation,
    this.title,
    this.leading,
    this.actions,
    this.brightness,
    this.centerTitle,
    this.pinned,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: title,
      centerTitle: centerTitle,
      leading: leading,
      actions: actions,
      backgroundColor: backgroundColor,
      elevation: elevation,
      brightness: brightness,
      pinned: pinned,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
