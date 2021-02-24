import 'package:beyondwallet/models/remote/edit_profile_model.dart';
import 'package:beyondwallet/services/api_services.dart';
import 'package:rxdart/rxdart.dart';

class EditProfileRepository {
  final Api _api;

  EditProfileRepository({Api api}) : _api = api;

  Future<UpdateEmailResponse> updateEmailRequest(UpdateEmailRequest updateEmailRequest) async{
    UpdateEmailResponse response = await _api.updateEmail(updateEmailRequest);
    return response;
  }
  Future<UpdateNameResponse> updateNameRequest(UpdateNameRequest updateNameRequest) async{
    UpdateNameResponse response = await _api.updateName(updateNameRequest);
    return response;
  }
}
