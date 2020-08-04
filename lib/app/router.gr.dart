// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../ui/view/home/home_view.dart';
import '../ui/view/media_preview/media_preview.dart';

class Routes {
  static const String homeView = '/';
  static const String mediaPreviewScreen = '/media-preview-screen';
  static const all = <String>{
    homeView,
    mediaPreviewScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.mediaPreviewScreen, page: MediaPreviewScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    MediaPreviewScreen: (data) {
      final args = data.getArgs<MediaPreviewScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => MediaPreviewScreen(
          args.videoPlayerController,
          files: args.files,
          current: args.current,
          currentIndex: args.currentIndex,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// MediaPreviewScreen arguments holder class
class MediaPreviewScreenArguments {
  final VideoPlayerController videoPlayerController;
  final List<FileSystemEntity> files;
  final FileSystemEntity current;
  final int currentIndex;
  MediaPreviewScreenArguments(
      {@required this.videoPlayerController,
      this.files,
      this.current,
      this.currentIndex});
}
