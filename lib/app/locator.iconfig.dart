// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:Explorer/services/counter_service.dart';
import 'package:Explorer/services/third_party_service_module.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final thirdPartyServiceModule = _$ThirdPartyServiceModule();
  g.registerLazySingleton<CounterService>(() => CounterService());
  g.registerLazySingleton<DialogService>(
      () => thirdPartyServiceModule.dialogService);
  g.registerLazySingleton<NavigationService>(
      () => thirdPartyServiceModule.navigationService);
}

class _$ThirdPartyServiceModule extends ThirdPartyServiceModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
}
