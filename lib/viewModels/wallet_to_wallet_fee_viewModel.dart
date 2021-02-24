import 'package:beyondwallet/models/remote/wallet_to_non_wallet_model.dart';
import 'package:beyondwallet/models/remote/wallet_to_wallet_fee_model.dart';
import 'package:beyondwallet/repositories/wallet_to_non_wallet_fee_repository.dart';
import 'package:beyondwallet/repositories/wallet_to_wallet_fee_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:beyondwallet/helpers/error_handling.dart';
import 'package:beyondwallet/models/remote/get_balance_model.dart';
import 'package:beyondwallet/repositories/get_balance_repository.dart';
import 'package:beyondwallet/viewModels/base_viewModel.dart';

class WalletToWalletFeeViewModel extends BaseViewModel {
  WalletToWalletFeeRepository _walletToWalletFeeRepository;
  WalletToWalletFeeResponse _walletToWalletFeeResponse;

  WalletToWalletFeeViewModel({@required WalletToWalletFeeRepository walletToWalletFeeRepository})
      : _walletToWalletFeeRepository = walletToWalletFeeRepository;

  WalletToWalletFeeResponse get getFee => _walletToWalletFeeResponse;

  void _setFee(  WalletToWalletFeeResponse walletToWalletFeeResponse) {
    _walletToWalletFeeResponse = walletToWalletFeeResponse;
  }

  Future checkWalletToWalletFee(WalletToWalletFeeRequest walletToWalletFeeRequest) async {
    _setFee(null);
    setFailure(null);
    setLoadingState(LoadingState.loading);
    try {
      final success = await _walletToWalletFeeRepository.checkWalletToWalletFeeRequest(walletToWalletFeeRequest);
      _setFee(success);
    } on Failure catch (f) {
      print("hola");
      setFailure(f);
    }
    setLoadingState(LoadingState.loaded);
  }
}
