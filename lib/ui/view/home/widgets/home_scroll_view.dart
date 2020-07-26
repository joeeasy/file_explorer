import 'package:Explorer/shared/shared_widgets/reusable_custom_scroll_view.dart';
import 'package:Explorer/shared/shared_widgets/search_bar/search_bar.dart';
import 'package:Explorer/ui/view/home/widgets/folder_list.dart';
import 'package:Explorer/ui/view/home/widgets/home_app_bar.dart';
import 'package:Explorer/ui/view/home/widgets/storage_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScrollView extends HookWidget {


  @override
  Widget build(BuildContext context) {
    var scrollViewController = useScrollController();
    return ReusableCustomScrollView(
      key: Key('_homeScrollView'),
      controller: scrollViewController,
      slivers: <Widget>[
        HomeAppBar(),
        SearchBar(),
        StorageBanner(),
        FolderList(),
      ],
    );
  }
}
