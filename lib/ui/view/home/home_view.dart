import 'package:Explorer/constants/colors.dart';
import 'package:Explorer/ui/view/home/widgets/home_scroll_view.dart';
import 'package:Explorer/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) async {
        model.initHomeView(
          extensions: [
            'png',
            'jpg',
            'jpeg',
            'mp4',
          ],
        );
      },
      builder: (context, model, child) => RefreshIndicator(
        onRefresh: () => model.initHomeView(
          extensions: [
            'png',
            'jpg',
            'jpeg',
            'mp4',
          ],
        ),
        child: Scaffold(
          backgroundColor: AppColor.background,
          body: (model.isStorageAllowed != null)
              ? HomeScrollView(
                  isStorageAllowed: model.isStorageAllowed,
                  model: model,
                )
              : Container(
                  height: mediaQueryVertical(context, 1),
                  width: mediaQueryHorizontal(context, 1),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
