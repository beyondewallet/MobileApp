import 'package:beyondwallet/models/remote/is_wallet_exist_model.dart';
import 'package:beyondwallet/repositories/is_wallet_exist_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:beyondwallet/helpers/error_handling.dart';
import 'package:beyondwallet/models/remote/get_balance_model.dart';
import 'package:beyondwallet/repositories/get_balance_repository.dart';
import 'package:beyondwallet/viewModels/base_viewModel.dart';

class IsWalletExistViewModel extends BaseViewModel {
  IsWalletExistRepository _isWalletExistRepository;
  IsWalletExistResponse _isWalletExistResponse;

  IsWalletExistViewModel({@required IsWalletExistRepository isWalletExistRepository})
      : _isWalletExistRepository = isWalletExistRepository;

  IsWalletExistResponse get getUser => _isWalletExistResponse;

  void _setWalletExist(IsWalletExistResponse isWalletExistResponse) {
    _isWalletExistResponse = isWalletExistResponse;
  }

  Future isWalletExistRequest(IsWalletExistRequest request) async {
    _setWalletExist(null);
    setFailure(null);
    setLoadingState(LoadingState.loading);
    try {
      final success = await _isWalletExistRepository.isWalletExistRequest(request);
      _setWalletExist(success);
    } on Failure catch (f) {
      setFailure(f);
    }
    setLoadingState(LoadingState.loaded);
  }
}
