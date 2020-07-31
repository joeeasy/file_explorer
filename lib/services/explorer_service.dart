import 'dart:io';
import 'dart:typed_data';

import 'package:Explorer/ui/view/home/widgets/video_thumbnail/video_thumbnail_view.dart';
import 'package:Explorer/utils/helpers.dart';
import 'package:disk_space/disk_space.dart';
import 'package:flutter_file_utils/flutter_file_utils.dart';
import 'package:flutter_file_utils/utils.dart';
import 'package:injectable/injectable.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

@lazySingleton
class ExplorerSerice {
  bool _isStoragePermission;
  List<FileSystemEntity> _files;
  double _freeDiskSpace;
  double get freeDiskSpace => _freeDiskSpace;
  double _totalDiskSpace;
  double get totalDiskSpace => _totalDiskSpace;

  List<FileSystemEntity> get files => _files;

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
    _files = await FileManager(root: root[0]).recentFilesAndDirs(
      100,
      excludeHidden: false,
      sortedBy: FlutterFileUtilsSorting.Date,
      reversed: true,
      extensions: extensions?? null
    );
  }


  void initVideoPlayerController(String path) async {
    _playerController = await VideoPlayerController.file(File(path));

  }

  void getStorageInfo()async {
    _freeDiskSpace = await DiskSpace.getFreeDiskSpace;
    _totalDiskSpace = await DiskSpace.getTotalDiskSpace;
    loger(e: _totalDiskSpace, loggerText: 'totalDiskSpace');
  }

  void getThumbNail(String filePath) async {
    _thumbNail = await VideoThumbnail.thumbnailData(
      video: filePath,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 80,
      // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      quality: 25,
    );
  }
}
