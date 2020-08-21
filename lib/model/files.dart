import 'dart:io';
import 'dart:typed_data';

import 'package:video_thumbnail/video_thumbnail.dart';

class FileModel {
  final String filePath;
  final bool isImage;
  final FileSystemEntity file;
  final Uint8List thumbNail;

  FileModel(this.file, {this.thumbNail, this.filePath, this.isImage});



}
