import 'package:Explorer/constants/constants.dart';
import 'package:Explorer/shared/shared_styling/style.dart';
import 'package:Explorer/shared/shared_widgets/search_bar/search_bar_viewmodel.dart';
import 'package:Explorer/utils/icon_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchBarViewModel>.nonReactive(
      builder: (model, context, child) => SliverToBoxAdapter(
        child: Container(
          height: 56,
          margin: EdgeInsets.only(
            left: 24,
            right: 24,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: TextField(
              style: inputStyle,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: loadAsset(assetPath: searchIcon, isSvg: true),
                  onPressed: () {},
                ),
                contentPadding: EdgeInsets.only(left: 16, right: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30),
                ),
                hintStyle: inputStyle,
                hintText: 'Search Files',
                fillColor: Colors.white,
                filled: true,
              ),
            ),

          ),
        ),
      ),
      viewModelBuilder: () => SearchBarViewModel(),
    );
  }
}
