import 'package:Explorer/constants/colors.dart';
import 'package:Explorer/constants/constants.dart';
import 'package:Explorer/ui/view/home/widgets/home_scroll_view.dart';
import 'package:Explorer/utils/icon_utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: HomeScrollView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => model.updateCounter(),
          child: loadAsset(assetPath: AppIcon.add, isSvg: true),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
