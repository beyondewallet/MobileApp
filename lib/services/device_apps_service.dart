import 'package:device_apps/device_apps.dart';

class DeviceAppService {
  List<Application> _appsList;

  Future fetchAllDeviceApplications() async {
    var _appsList = (await DeviceApps.getInstalledApplications(
            onlyAppsWithLaunchIntent: true, includeSystemApps: true))
        .toList();
    for(var c in _appsList) {
      print(c.appName);
    }  }
}
