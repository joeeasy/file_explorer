
import 'package:Explorer/model/files_category_model.dart';
import 'package:Explorer/utils/icon_utils.dart';
import 'package:flutter/material.dart';

class FolderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 24, right: 24),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Container(
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: loadAsset(
                      assetPath: fileCategories[index].icon, isSvg: true),
                  onPressed: () {},
                ),
                Text(
                  fileCategories[index].iconText,
                )
              ],
            ),
          ),
          childCount: fileCategories.length,
        ),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      ),
    );
  }
}
