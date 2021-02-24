import 'package:beyondwallet/models/remote/send_money_wallet_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:beyondwallet/repositories/send_money_wallet_repository.dart';
import 'package:beyondwallet/helpers/error_handling.dart';
import 'base_viewModel.dart';

class SendMoneyWalletViewModel extends BaseViewModel{
  SendMoneyWalletRepository _sendMoneyWalletRepository;
  SendMoneyToWalletResponse _sendMoneyToWalletResponse;


  SendMoneyWalletViewModel({@required SendMoneyWalletRepository sendMoneyWalletRepository})
      : _sendMoneyWalletRepository = sendMoneyWalletRepository;


  SendMoneyToWalletResponse get sendMoneyToWalletData => _sendMoneyToWalletResponse;


  void _setSendMoneyWallet(SendMoneyToWalletResponse sendMoneyToWalletResponse) {
    _sendMoneyToWalletResponse = sendMoneyToWalletResponse;
    print(sendMoneyToWalletResponse);
  }


  Future sendMoneyToWallet(SendMoneyToWalletRequest request) async {
    setLoadingState(LoadingState.loading);
    try {
      final sent = await _sendMoneyWalletRepository.sendMoneyToWallet(request);
      _setSendMoneyWallet(sent);
    } on Failure catch (f) {
      setFailure(f);
    }
    setLoadingState(LoadingState.loaded);
  }

}




