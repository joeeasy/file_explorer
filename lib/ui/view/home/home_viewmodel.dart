import 'dart:io';
import 'dart:typed_data';

import 'package:Explorer/app/locator.dart';
import 'package:Explorer/services/explorer_service.dart';
import 'package:Explorer/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class HomeViewModel extends BaseViewModel {
  ExplorerSerice _explorerSerice = locator<ExplorerSerice>();
  String _title = 'Home View';

  String get title => '$_title $_counter';
  int _counter = 0;

  int get counter => _counter;

  bool get isStorageAllowed => _explorerSerice.isStorageAllowed;

  int get freeDiskSpace => _explorerSerice.freeDiskSpace;

  int get totalDiskSpace => _explorerSerice.totalDiskSpace;

  List<FileSystemEntity> get fileList => _explorerSerice.files;

  VideoPlayerController get controller => _explorerSerice.controller;

  Future<void> checkStoragePermission() async {
    _explorerSerice.checkStoragePermission();
    notifyListeners();
  }

  Future<void> getFiles({List<String> extensions}) async {
    await _explorerSerice.getFiles(
      extensions: extensions,
    );
    notifyListeners();
  }

  void getStorageInfo() {
    _explorerSerice.getStorageInfo();
  }

  int getStoragePercentile({double freeStorageSize, double totalStorageSize}) =>
      _explorerSerice.getStoragePercentile(
        freeStorageSize: freeStorageSize,
        totalStorageSize: totalStorageSize,
      );
}
