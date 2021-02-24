import 'package:beyondwallet/models/remote/get_contact_list_model.dart';
import 'package:beyondwallet/services/api_services.dart';
import 'dart:async';

class GetContactListRepository {
  final Api _api;

  GetContactListRepository({Api api}) : _api = api;

  Future<GetContactListResponse> getContactListRequest() async{
    GetContactListResponse response = await _api.getContactList();
    return response;
  }

}
