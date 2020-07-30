import 'package:Explorer/constants/colors.dart';
import 'package:Explorer/constants/constants.dart';
import 'package:Explorer/shared/shared_styling/style.dart';
import 'package:Explorer/shared/shared_widgets/reusable_custom_scroll_view.dart';
import 'package:Explorer/shared/shared_widgets/search_bar/search_bar.dart';
import 'package:Explorer/ui/view/home/home_viewmodel.dart';
import 'package:Explorer/ui/view/home/widgets/folder_list.dart';
import 'package:Explorer/ui/view/home/widgets/home_app_bar.dart';
import 'package:Explorer/ui/view/home/widgets/recent_file_lists.dart';
import 'package:Explorer/ui/view/home/widgets/storage_banner.dart';
import 'package:Explorer/utils/icon_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScrollView extends HookWidget {
  final bool isStorageAllowed;
  final HomeViewModel model;

  HomeScrollView({this.model, this.isStorageAllowed});

  @override
  Widget build(BuildContext context) {
    var scrollViewController = useScrollController();
    return (isStorageAllowed == null)
        ? Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    iconSize: 150,
                    icon: loadAsset(
                      isSvg: true,
                      assetPath: AppIcon.grey_icon,
                    ),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Permission Not Enabled'),
                ),
                RaisedButton(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.brandPrimary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.only(
                      top: 16,
                      bottom: 16,
                      left: 40,
                      right: 40,
                    ),
                    child: Text(
                      'Enable Storage Permission',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  onPressed: null,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ],
            ),
          )
        : ReusableCustomScrollView(
            key: Key('_homeScrollView'),
            controller: scrollViewController,
            slivers: <Widget>[
              HomeAppBar(),
              SearchBar(),
              StorageBanner(),
              FolderGrid(),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    'Recent files',
                    style: headerStyle,
                  ),
                ),
              ),
              RecentFileList(
                recentFiles: model.fileList,
                model: model,
              )
            ],
          );
  }
}
