import 'package:beyondwallet/models/remote/verify_user_model.dart';
import 'package:beyondwallet/services/api_services.dart';

class VerifyUserRepository {
  final Api _api;

  VerifyUserRepository({Api api}) : _api = api;

  Future<VerifyUserResponse> verifyUserRequest(VerifyUserRequest verifyUserRequest) async {
    VerifyUserResponse response = await _api.verifyUser(verifyUserRequest);
    return response;
  }
}
