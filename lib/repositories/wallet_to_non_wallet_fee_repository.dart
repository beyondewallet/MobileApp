import 'package:beyondwallet/models/remote/login_model.dart';
import 'package:beyondwallet/models/remote/get_balance_model.dart';
import 'package:beyondwallet/models/remote/wallet_to_non_wallet_model.dart';
import 'package:beyondwallet/services/api_services.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class WalletToNonWalletFeeRepository {
  final Api _api;

  WalletToNonWalletFeeRepository({Api api}) : _api = api;

  Future<WalletToNonWalletFeeResponse> checkNonWalletToWalletFeeRequest(WalletToNonWalletFeeRequest walletToNonWalletFeeRequest) async{
    print("hello");
    WalletToNonWalletFeeResponse response = await _api.walletToNonWalletFee(walletToNonWalletFeeRequest);
    return response;
  }

}
