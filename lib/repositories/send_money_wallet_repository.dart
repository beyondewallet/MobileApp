import 'package:beyondwallet/models/remote/login_model.dart';
import 'package:beyondwallet/models/remote/send_money_wallet_model.dart';
import 'package:beyondwallet/services/api_services.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class SendMoneyWalletRepository {
  final Api _api;

  SendMoneyWalletRepository({Api api}) : _api = api;

  Future<SendMoneyToWalletResponse> sendMoneyToWallet(SendMoneyToWalletRequest request) async{
    SendMoneyToWalletResponse response = await _api.sendMoneyToWallet(request);
    return response;

  }

}
