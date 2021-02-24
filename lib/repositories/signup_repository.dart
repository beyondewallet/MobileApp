import 'package:beyondwallet/models/remote/signup_model.dart';
import 'package:beyondwallet/services/api_services.dart';
import 'package:rxdart/rxdart.dart';

class SignUpRepository {
  final Api _api;

  SignUpRepository({Api api}) : _api = api;

  Future<SignUpResponse> signUpRequest(SignUpRequest signUpRequest) async{
    SignUpResponse response = await _api.signUp(signUpRequest);
    return response;
  }
}
