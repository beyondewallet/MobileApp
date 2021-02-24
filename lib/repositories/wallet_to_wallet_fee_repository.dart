import 'package:beyondwallet/models/remote/login_model.dart';
import 'package:beyondwallet/models/remote/get_balance_model.dart';
import 'package:beyondwallet/models/remote/wallet_to_wallet_fee_model.dart';
import 'package:beyondwallet/services/api_services.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class WalletToWalletFeeRepository {
  final Api _api;

  WalletToWalletFeeRepository({Api api}) : _api = api;

  Future<WalletToWalletFeeResponse> checkWalletToWalletFeeRequest(WalletToWalletFeeRequest walletToWalletFeeRequest) async{
    WalletToWalletFeeResponse response = await _api.walletToWalletFee(walletToWalletFeeRequest);
    return response;
  }

}
