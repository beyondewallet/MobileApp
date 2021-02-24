import 'package:get_it/get_it.dart';
import 'package:beyondwallet/services/dialog_service.dart';
import 'package:beyondwallet/services/sharedprefs_services.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  var sharedPrefsInstance = await SharedPrefsService.getInstance();
  locator.registerSingleton<SharedPrefsService>(sharedPrefsInstance);
  locator.registerLazySingleton(() => DialogService());

}