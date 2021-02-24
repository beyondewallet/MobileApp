import 'package:beyondwallet/models/remote/get_transaction_history_model.dart';
import 'package:beyondwallet/repositories/get_transaction_history_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:beyondwallet/helpers/error_handling.dart';
import 'package:beyondwallet/viewModels/base_viewModel.dart';

class GetTransactionHistoryViewModel extends BaseViewModel {
  GetTransactionHistoryRepository _getTransactionHistoryRepository;
  GetTransactionHistoryResponse _getTransactionHistoryResponse;

  GetTransactionHistoryViewModel({@required GetTransactionHistoryRepository getTransactionHistoryRepository})
      : _getTransactionHistoryRepository = getTransactionHistoryRepository;

  GetTransactionHistoryResponse get getTransactionHistory => _getTransactionHistoryResponse;

  void _setTransactionHistory(GetTransactionHistoryResponse getTransactionHistoryResponse) {
    _getTransactionHistoryResponse = getTransactionHistoryResponse;
  }

  Future requestTransactionHistory() async {
    _setTransactionHistory(null);
    setFailure(null);
    setLoadingState(LoadingState.loading);
    try {
      final success = await _getTransactionHistoryRepository.getTransactionHistoryRequest();
      _setTransactionHistory(success);
    } on Failure catch (f) {
      setFailure(f);
    }
    setLoadingState(LoadingState.loaded);
  }
}
