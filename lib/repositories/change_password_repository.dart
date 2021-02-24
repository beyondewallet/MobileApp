import 'package:beyondwallet/models/remote/change_pasword_model.dart';
import 'package:beyondwallet/services/api_services.dart';
import 'package:rxdart/rxdart.dart';

class ChangePasswordRepository {
  final Api _api;

  ChangePasswordRepository({Api api}) : _api = api;

  Future<ChangePasswordResponse> changePasswordRequest(ChangePasswordRequest changePasswordRequest) async{
    ChangePasswordResponse response = await _api.changePassword(changePasswordRequest);
    return response;
  }
}
