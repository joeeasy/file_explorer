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

  BaseAppBar({
    this.appBar,
    this.backgroundColor,
    this.elevation,
    this.title,
    this.leading,
    this.actions,
    this.brightness, this.centerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle
      : centerTitle,
      leading: leading,
      actions: actions,
      backgroundColor: backgroundColor,
      elevation: elevation,
      brightness: brightness,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}