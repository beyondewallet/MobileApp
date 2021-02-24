import 'package:beyondwallet/models/remote/login_model.dart';
import 'package:beyondwallet/services/api_services.dart';
import 'package:rxdart/rxdart.dart';

class LoginRepository {
  final Api _api;

  LoginRepository({Api api}) : _api = api;

  Future<LoginResponse> loginRequest(LoginRequest loginRequest) async{
    LoginResponse response = await _api.login(loginRequest);
   return response;
  }
}
