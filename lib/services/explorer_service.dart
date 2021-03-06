import 'dart:io';
import 'dart:typed_data';

import 'package:Explorer/model/files.dart';
import 'package:Explorer/utils/helpers.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_utils/flutter_file_utils.dart';
import 'package:flutter_file_utils/utils.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:Explorer/utils/extension_methods/extension.dart';

@lazySingleton
class ExplorerSerice {
  bool _isStoragePermission;
  List<FileSystemEntity> _files;
  List<FileModel> _formatedFiles = [];
  int _storagePercentage;

  int get storagePercentage => _storagePercentage;
  int _freeDiskSpace;

  int get freeDiskSpace => _freeDiskSpace;
  int _totalDiskSpace;

  int get totalDiskSpace => _totalDiskSpace;

  List<FileModel> get formatedFiles => _formatedFiles;

  bool get isStorageAllowed => _isStoragePermission;
  VideoPlayerController _playerController;

  get controller => _playerController;

  Uint8List _thumbNail;

  get thumbNail => _thumbNail;

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
    _files = await FileManager(root: root[0]).recentFilesAndDirs(100,
        excludeHidden: false,
        sortedBy: FlutterFileUtilsSorting.Date,
        reversed: true,
        extensions: extensions ?? null);
    _files.forEach((file) async {
      var thumbNail = file.path.isImage()
          ? await VideoThumbnail.thumbnailData(
              video: file.path,
              imageFormat: ImageFormat.JPEG,
              maxWidth: 80,
              // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
              quality: 25,
            )
          : null;
      _formatedFiles.add(
        FileModel(
          file,
          filePath: file.path,
          isImage: file.path.isImage(),
          thumbNail: thumbNail,
        ),
      );
    });
  }

  void initVideoPlayerController(String path) async {
    _playerController = VideoPlayerController.file(File(path))..initialize();
  }

  void getStorageInfo() async {
    const storageChannel = const MethodChannel('storage');

    _freeDiskSpace = await storageChannel.invokeMethod('getFreeDiskSpace');
    _totalDiskSpace = await storageChannel.invokeMethod('getTotalDiskSpace');
  }

  void getThumbNail(String filePath) async {
    _thumbNail = await VideoThumbnail.thumbnailData(
      video: filePath,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 80,
      // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      quality: 25,
    );
    loger(e: _thumbNail, loggerText: 'thumbnail for each videos');
  }

  int getStoragePercentile({double freeStorageSize, double totalStorageSize}) {
    var result = (freeStorageSize / totalStorageSize) * 100;
    loger(e: result);
    return result.toInt();
  }
}
