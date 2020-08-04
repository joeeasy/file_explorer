import 'dart:io';

import 'package:Explorer/app/locator.dart';
import 'package:Explorer/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future natiiveToHome({int currentIndex, List<FileSystemEntity> files}) async {
    _navigationService.navigateTo(
      Routes.homeView,
      arguments: {currentIndex, files},
    );
  }
}
