import 'package:flutter/cupertino.dart';
import 'package:beyondwallet/helpers/error_handling.dart';
import 'package:beyondwallet/models/remote/get_balance_model.dart';
import 'package:beyondwallet/repositories/get_balance_repository.dart';
import 'package:beyondwallet/viewModels/base_viewModel.dart';

class GetBalanceViewModel extends BaseViewModel {
  GetBalanceRepository _getBalanceRepository;
  GetBalanceResponse _getBalanceResponse;

  GetBalanceViewModel({@required GetBalanceRepository getBalanceRepository})
      : _getBalanceRepository = getBalanceRepository;

  GetBalanceResponse get getBalance => _getBalanceResponse;

  void _setWalletBalance(GetBalanceResponse getBalanceResponse) {
    _getBalanceResponse = getBalanceResponse;
  }

  Future getBalanceRequest() async {
    _setWalletBalance(null);
    setFailure(null);
    setLoadingState(LoadingState.loading);
    try {
      final success = await _getBalanceRepository.getBalanceRequest();
      _setWalletBalance(success);
    } on Failure catch (f) {
      setFailure(f);
    }
    setLoadingState(LoadingState.loaded);
  }
}
