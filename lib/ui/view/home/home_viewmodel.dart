import 'dart:io';

import 'package:Explorer/app/locator.dart';
import 'package:Explorer/app/router.gr.dart';
import 'package:Explorer/services/explorer_service.dart';
import 'package:Explorer/utils/helpers.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_player/video_player.dart';

class HomeViewModel extends BaseViewModel {
  ExplorerSerice _explorerSerice = locator<ExplorerSerice>();
  NavigationService _navigationService = locator<NavigationService>();
  String _title = 'Home View';

  String get title => '$_title $_counter';
  int _counter = 0;

  int get counter => _counter;

  bool get isStorageAllowed => _explorerSerice.isStorageAllowed;

  int get freeDiskSpace => _explorerSerice.freeDiskSpace;

  int get totalDiskSpace => _explorerSerice.totalDiskSpace;

  List<FileSystemEntity> get fileList => _explorerSerice.files;

  VideoPlayerController get controller => _explorerSerice.controller;

  Future<void> initHomeView({List<String> extensions}) async {

    try {
      await checkStoragePermission();
      getStorageInfo();
      await getFiles(extensions: extensions);
      notifyListeners();

    } catch(e) {
      loger(e: e);
    }
  }

  Future<void> checkStoragePermission() async {
    _explorerSerice.checkStoragePermission();
  }

  Future<void> getFiles({List<String> extensions}) async {
    await _explorerSerice.getFiles(
      extensions: extensions,
    );
  }

  void getStorageInfo() {
    _explorerSerice.getStorageInfo();
  }

  int getStoragePercentile({double freeStorageSize, double totalStorageSize}) =>
      _explorerSerice.getStoragePercentile(
        freeStorageSize: freeStorageSize,
        totalStorageSize: totalStorageSize,
      );

  void previewFile(
      {int currentIndex,
      List<FileSystemEntity> files,
      VideoPlayerController videoPlayerController,
      FileSystemEntity current}) async {
    _navigationService.navigateTo(
      Routes.mediaPreviewScreen,
      arguments: MediaPreviewScreenArguments(
        current: current,
        files: files,
        currentIndex: currentIndex,
        videoPlayerController: videoPlayerController,
      ),
    );
    notifyListeners();
  }


}
