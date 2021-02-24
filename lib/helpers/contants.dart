import 'package:permission_handler/permission_handler.dart';

class Constants {

  static String authToken;
  static double balance = 0.0;
  static String firstName;
  static String userBankName;
  static String mobileNumber;
  static String email;
  static String userName;
  static bool isUserVerified = false;
  static String country;

 static List<PermissionGroup> permissionsList = <PermissionGroup>[
    PermissionGroup.camera,
    PermissionGroup.contacts,
    PermissionGroup.location,
    PermissionGroup.phone,
    PermissionGroup.sms,
    PermissionGroup.storage,
  ];
}
