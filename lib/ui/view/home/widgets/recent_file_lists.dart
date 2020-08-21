import 'dart:io';

import 'package:Explorer/constants/constants.dart';
import 'package:Explorer/model/files.dart';
import 'package:Explorer/ui/view/home/home_viewmodel.dart';
import 'package:Explorer/ui/view/home/widgets/video_thumbnail/video_thumbnail_view.dart';
import 'package:Explorer/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:Explorer/utils/extension_methods/extension.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentFileList extends HookWidget {
  final List<FileModel> recentFiles;
  final HomeViewModel model;

  RecentFileList({@required this.recentFiles, this.model});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          loger(
            loggerText: 'recentFiles[index].path.toString()',
            e: recentFiles[index].filePath,
          );
          var file = recentFiles[index].filePath;
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
                      recentFiles[index]?.filePath?.getFileName(),
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

  final List<FileModel> fileList;
  final FileModel current;
  final int index;
  final HomeViewModel model;

  @override
  Widget build(BuildContext context) {
    var file = fileList[index].filePath;

    return GestureDetector(
      onTap: () {
        if (!fileList[index].filePath.isImage()) {
          loger(e: index, loggerText: 'File index from ontap');
        }
        model.previewFile(
          currentIndex: index,
          files: fileList,
          current: current,
        );
      },
      child: file.isImage()
          ? Image.file(
              fileList[index].file,
              fit: BoxFit.fitHeight,
              height: 60,
              width: 60,
            )
          : VideoThumbNail(
              fileModel: fileList[index],
            ),
    );
  }
}
