import 'dart:typed_data';

import 'package:Explorer/app/locator.dart';
import 'package:Explorer/services/explorer_service.dart';
import 'package:Explorer/utils/helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

class VideoThumbNailViewModel extends BaseViewModel {
  ExplorerSerice _explorerSerice = locator<ExplorerSerice>();
  VideoPlayerController get controller => _explorerSerice.controller;
  Uint8List get thumbNail => _explorerSerice.thumbNail;
  set thumbNail(Uint8List thumbnail) {
    return null;
  }

  void initVideoPlayerController(String file) {

    _explorerSerice.initVideoPlayerController(file);
    notifyListeners();
  }

  String getThumbNail(String filePath) {
    _explorerSerice.getThumbNail(filePath);
    notifyListeners();
    return _explorerSerice.thumbNail.toString();
  }



}