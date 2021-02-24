import 'package:beyondwallet/models/remote/wallet_to_non_wallet_model.dart';
import 'package:beyondwallet/repositories/wallet_to_non_wallet_fee_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:beyondwallet/helpers/error_handling.dart';
import 'package:beyondwallet/models/remote/get_balance_model.dart';
import 'package:beyondwallet/repositories/get_balance_repository.dart';
import 'package:beyondwallet/viewModels/base_viewModel.dart';

class WalletToNonWalletFeeViewModel extends BaseViewModel {
  WalletToNonWalletFeeRepository _walletToNonWalletFeeRepository;
  WalletToNonWalletFeeResponse _walletToNonWalletFeeResponse;

  WalletToNonWalletFeeViewModel({@required WalletToNonWalletFeeRepository walletToNonWalletFeeRepository})
      : _walletToNonWalletFeeRepository = walletToNonWalletFeeRepository;

  WalletToNonWalletFeeResponse get getFee => _walletToNonWalletFeeResponse;

  void _setFee(  WalletToNonWalletFeeResponse walletToNonWalletFeeResponse) {
    _walletToNonWalletFeeResponse = walletToNonWalletFeeResponse;
  }

  Future checkWalletToNonWalletFee(WalletToNonWalletFeeRequest walletToNonWalletFeeRequest) async {
    _setFee(null);
    setFailure(null);
    setLoadingState(LoadingState.loading);
    try {
      final success = await _walletToNonWalletFeeRepository.checkNonWalletToWalletFeeRequest(walletToNonWalletFeeRequest);
      _setFee(success);
    } on Failure catch (f) {
      print("hola");
      setFailure(f);
    }
    setLoadingState(LoadingState.loaded);
  }
}
