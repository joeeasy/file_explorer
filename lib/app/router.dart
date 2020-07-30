
import 'package:auto_route/auto_route_annotations.dart';
import 'package:Explorer/ui/view/home/home_view.dart';
import 'package:Explorer/ui/view/startup/startup_view.dart';

@MaterialAutoRouter()

class $Router {
  @initial
  HomeView homeViewRoute;
  StartupView startupViewRoute;

}