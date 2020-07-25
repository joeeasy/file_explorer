import 'package:Explorer/constants/colors.dart';
import 'package:Explorer/constants/constants.dart';
import 'package:Explorer/shared/shared_styling/style.dart';
import 'package:Explorer/shared/shared_widgets/explore_appbar.dart';
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
        appBar: BaseAppBar(
          appBar: AppBar(),
          title: Text(
            homeTitle,
            style: headerStyle,
          ),
          centerTitle: true,
          backgroundColor: backgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: loadAsset(
                assetPath: menuIcon, isSvg: true, width: 24, height: 24),
          ),
          actions: <Widget>[
            IconButton(
              icon: loadAsset(
                  assetPath: optionIcon, isSvg: true, height: 24, width: 24),
            ),
          ],
        ),
        body: Row(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => model.updateCounter(),
          child: Icon(Icons.add),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
