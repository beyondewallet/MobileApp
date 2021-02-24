import 'package:beyondwallet/models/remote/send_money_non_wallet_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:beyondwallet/repositories/send_money_non_wallet_repository.dart';
import 'package:beyondwallet/helpers/error_handling.dart';
import 'base_viewModel.dart';

class SendMoneyNonWalletViewModel extends BaseViewModel{
  SendMoneyNonWalletRepository _sendMoneyNonWalletRepository;
  SendMoneyToNonWalletResponse _sendMoneyToNonWalletResponse;


  SendMoneyNonWalletViewModel({@required SendMoneyNonWalletRepository sendMoneyNonWalletRepository})
      : _sendMoneyNonWalletRepository = sendMoneyNonWalletRepository;

  SendMoneyToNonWalletResponse get sendMoneyToNonWalletData => _sendMoneyToNonWalletResponse;

  void _setSendMoneyNonWallet(SendMoneyToNonWalletResponse sendMoneyToNonWalletResponse) {
    _sendMoneyToNonWalletResponse = sendMoneyToNonWalletResponse;
    print(sendMoneyToNonWalletResponse);
  }


  Future sendMoneyToNonWallet(SendMoneyToNonWalletRequest request) async {
    setLoadingState(LoadingState.loading);
    try {
      final sent = await _sendMoneyNonWalletRepository.sendMoneyToNonWallet(request);
      _setSendMoneyNonWallet(sent);
    } on Failure catch (f) {
      setFailure(f);
    }
    setLoadingState(LoadingState.loaded);
  }
}