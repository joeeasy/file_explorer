import 'package:Explorer/app/locator.dart';
import 'package:Explorer/services/media_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MediaPreviewViewModel extends BaseViewModel {
  MediaService _mediaService = locator<MediaService>();
  NavigationService _navigationService = locator<NavigationService>();
  
  
  void initializeMediaSettings() {

    notifyListeners();
  }



}