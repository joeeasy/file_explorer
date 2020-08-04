import 'dart:io';

import 'package:Explorer/ui/view/home/home_viewmodel.dart';
import 'package:Explorer/ui/view/home/widgets/video_thumbnail/video_thumbnail_view.dart';
import 'package:Explorer/ui/view/home/widgets/video_thumbnail/video_thumbnail_view_model.dart';
import 'package:Explorer/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:Explorer/utils/extension_methods/extension.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentFileList extends HookWidget {
  final List<FileSystemEntity> recentFiles;
  final HomeViewModel model;

  RecentFileList({@required this.recentFiles, this.model});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          loger(
            loggerText: 'recentFiles[index].path.toString()',
            e: recentFiles[index].path,
          );
          var file = model?.fileList[index].path;
          return Container(
            padding: EdgeInsets.all(8),
            child: OverflowBox(
              alignment: Alignment.center,
              child: FittedBox(
                fit: file.isImage() ? BoxFit.fitHeight : BoxFit.fitHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RenderMediaTypes(
                      model: model,
                      index: index,
                      current: recentFiles[index],
                      fileList: recentFiles,
                    ),
                    Text(
                      recentFiles[index]?.path?.getFileName(),
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        childCount: recentFiles.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
    );
  }
}

class RenderMediaTypes extends StatelessWidget {
  const RenderMediaTypes({
    Key key,
    this.index,
    this.model,
    this.fileList,
    this.current,
  }) : super(key: key);

  final List<FileSystemEntity> fileList;
  final FileSystemEntity current;
  final int index;
  final HomeViewModel model;

  @override
  Widget build(BuildContext context) {
    var file = fileList[index].path;

    return GestureDetector(
      onTap: () => model.previewFile(
          currentIndex: index, files: fileList, current: current),
      child: file.isImage()
          ? Image.file(
              fileList[index],
              fit: BoxFit.fitHeight,
              height: 60,
              width: 60,
            )
          : VideoThumbNail(
              filePath: fileList[index].path,
            ),
    );
  }
}
