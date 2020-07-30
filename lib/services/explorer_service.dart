import 'dart:io';

import 'package:Explorer/utils/helpers.dart';
import 'package:flutter_file_utils/flutter_file_utils.dart';
import 'package:flutter_file_utils/utils.dart';
import 'package:injectable/injectable.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

@lazySingleton
class ExplorerSerice {
  bool _isStoragePermission;
  List<FileSystemEntity> _files;

  List<FileSystemEntity> get files => _files;

  bool get isStorageAllowed => _isStoragePermission;
  VideoPlayerController _playerController;
  get controller => _playerController;

  void checkStoragePermission() async {
    var storagePermission = Permission.storage;
    var permissionGranted = await storagePermission.status;
    if (permissionGranted.isGranted) {
      _isStoragePermission = permissionGranted.isGranted;
    } else {
      permissionGranted = await storagePermission.request();
      _isStoragePermission = permissionGranted.isGranted;
    }
  }

  Future<void> getFiles({List<String> extensions}) async {
    var root = await getStorageList();
    loger(e: root[0].path, loggerText: 'root');
    _files = await FileManager(root: root[0]).recentFilesAndDirs(
      100,
      excludeHidden: false,
      sortedBy: FlutterFileUtilsSorting.Date,
      reversed: true,
      extensions: extensions?? null
    );
    loger(
      e: _files,
    );
  }

  Future<void> openImage(String imagePath) async {
    await OpenFile.open(imagePath);
  }

  void initVideoPlayerController(String path) {
    _playerController = VideoPlayerController.file(File(path))
        ..initialize();
  }
}
