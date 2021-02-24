import 'package:flutter/cupertino.dart';
import 'package:beyondwallet/helpers/error_handling.dart';
import 'package:beyondwallet/models/remote/get_contact_list_model.dart';
import 'package:beyondwallet/repositories/get_contact_list_repository.dart';
import 'package:beyondwallet/viewModels/base_viewModel.dart';

class GetContactListViewModel extends BaseViewModel {
  GetContactListRepository _contactListRepository;
  GetContactListResponse _getContactListResponse;

  GetContactListViewModel({@required GetContactListRepository getContactListRepository})
      : _contactListRepository = getContactListRepository;

  GetContactListResponse get getContactList => _getContactListResponse;

  void _setContactList(GetContactListResponse getContactListResponse) {
    _getContactListResponse = getContactListResponse;
  }

  Future requestContactsList() async {
    _setContactList(null);
    setFailure(null);
    setLoadingState(LoadingState.loading);
    try {
      final success = await _contactListRepository.getContactListRequest();
      _setContactList(success);
    } on Failure catch (f) {
      setFailure(f);
    }
    setLoadingState(LoadingState.loaded);
  }
}
