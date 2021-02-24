import 'package:beyondwallet/models/remote/edit_profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:beyondwallet/repositories/edit_profile_repository.dart';
import 'package:beyondwallet/helpers/error_handling.dart';
import 'base_viewModel.dart';

class EditProfileViewModel extends BaseViewModel{
  EditProfileRepository _editProfileRepository;
  UpdateNameResponse _updateNameResponse;
  UpdateEmailResponse _updateEmailResponse;


  EditProfileViewModel({@required EditProfileRepository editProfileRepository})
      : _editProfileRepository = editProfileRepository;

  UpdateEmailResponse get updateEmailResponse => _updateEmailResponse;

  void _setUpdateEmail(UpdateEmailResponse updateEmailResponse) {
    _updateEmailResponse = updateEmailResponse;
  }

  UpdateNameResponse get updateNameResponse => _updateNameResponse;

  void _setUpdateName(UpdateNameResponse updateNameResponse) {
    _updateNameResponse = updateNameResponse;
  }


  Future updateEmail(UpdateEmailRequest request) async {
    setLoadingState(LoadingState.loading);
    try {
      final sent = await _editProfileRepository.updateEmailRequest(request);
      _setUpdateEmail(sent);
    } on Failure catch (f) {
      setFailure(f);
    }
    setLoadingState(LoadingState.loaded);
  }

  Future updateName(UpdateNameRequest request) async {
    setLoadingState(LoadingState.loading);
    try {
      final sent = await _editProfileRepository.updateNameRequest(request);
      _setUpdateName(sent);
    } on Failure catch (f) {
      setFailure(f);
    }
    setLoadingState(LoadingState.loaded);
  }
}