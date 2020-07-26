import 'package:Explorer/constants/colors.dart';
import 'package:Explorer/constants/constants.dart';
import 'package:Explorer/shared/shared_styling/style.dart';
import 'package:Explorer/shared/shared_widgets/explore_appbar.dart';
import 'package:Explorer/utils/icon_utils.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseAppBar(
      pinned: true,
      appBar: AppBar(),
      title: Text(
        headerTitle,
        style: headerStyle,
      ),
      centerTitle: true,
      backgroundColor: AppColor.background,
      elevation: 0,
      leading: IconButton(
        iconSize: 48,
        icon: loadAsset(
          assetPath: AppIcon.menu,
          isSvg: true,
          height: 48
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: loadAsset(
            assetPath: AppIcon.option,
            isSvg: true,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
