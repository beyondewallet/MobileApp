import 'dart:async';

import 'package:beyondwallet/models/remote/login_model.dart';
import 'package:beyondwallet/models/remote/user_details_model.dart';
import 'package:beyondwallet/services/api_services.dart';
import 'package:rxdart/rxdart.dart';

class UserDetailsRepository {
  final Api _api;

  UserDetailsRepository({Api api}) : _api = api;

  Future<UserDetailsResponse> userDetailsRequest() async{
    UserDetailsResponse response = await _api.userDetails();
   return response;
  }

}
