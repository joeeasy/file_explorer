//
import 'package:Explorer/constants/constants.dart';

class FileCategories {
  final String icon;
  final String iconText;
  final String id;

  FileCategories({
    this.icon,
    this.iconText,
    this.id,
  });
}

List<FileCategories> fileCategories = <FileCategories>[
  FileCategories(
    id: '_audio',
    icon: AppIcon.audio,
    iconText: 'Audio',
  ),
  FileCategories(
    id: '_movies',
    icon: AppIcon.video,
    iconText: 'Movies',
  ),
  FileCategories(
    id: '_images',
    icon: AppIcon.image,
    iconText: 'Images',
  ),
  FileCategories(id: '_apps', icon: AppIcon.app, iconText: 'APP'),
  FileCategories(
    id: '_document',
    icon: AppIcon.document,
    iconText: 'Documents',
  ),
  FileCategories(
    id: '_logger',
    icon: AppIcon.logger,
    iconText: 'Logger',
  ),
  FileCategories(
    id: '_drive',
    icon: AppIcon.drive,
    iconText: 'Drive',
  ),
  FileCategories(
    id: '_bin',
    icon: AppIcon.bin,
    iconText: 'Bin',
  ),
];
