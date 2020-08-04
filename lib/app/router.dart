import 'package:Explorer/ui/view/media_preview/media_preview.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:Explorer/ui/view/home/home_view.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(
    page: HomeView,
    initial: true,
  ),
  MaterialRoute(
    page: MediaPreviewScreen,
    fullscreenDialog: true,
  ),
])
class $Router {}
