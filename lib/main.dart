import 'package:Explorer/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:Explorer/app/locator.dart';
import 'package:Explorer/app/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      debugShowCheckedModeBanner: ,
      title: 'File Explorer',
      theme: ThemeData(
        accentColor:  AppColor.brandPrimary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.homeViewRoute,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
