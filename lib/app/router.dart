
import 'package:auto_route/auto_route_annotations.dart';
import 'package:file_explorer/ui/view/home/home_view.dart';
import 'package:file_explorer/ui/view/startup/startup_view.dart';

@MaterialAutoRouter()

class $Router {
  @initial
  StartupView startupViewRoute;
  HomeView homeViewRoute;

}