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
      appBar: AppBar(),
      title: Text(
        headerTitle,
        style: headerStyle,
      ),
      centerTitle: true,
      backgroundColor: AppColor.background,
      elevation: 0,
      leading: IconButton(
        icon: loadAsset(
            assetPath: AppIcon.menu, isSvg: true, width: 24, height: 24,),
      ),
      actions: <Widget>[
        IconButton(
          icon: loadAsset(
              assetPath: AppIcon.option, isSvg: true, height: 24, width: 24),
        ),
      ],
    );
  }
}
