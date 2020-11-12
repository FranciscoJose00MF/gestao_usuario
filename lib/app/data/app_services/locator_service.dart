import 'package:gestao_usuario/app/data/app_services/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  // locator.registerLazySingleton(() => DynamicLinkService());
  locator.registerLazySingleton(() => NavigationService());
  // locator.registerLazySingleton(() => ScaffoldService());
}
