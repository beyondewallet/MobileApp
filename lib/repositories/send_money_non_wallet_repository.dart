import 'package:beyondwallet/models/remote/login_model.dart';
import 'package:beyondwallet/models/remote/send_money_non_wallet_model.dart';
import 'package:beyondwallet/services/api_services.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class SendMoneyNonWalletRepository {
  final Api _api;

  SendMoneyNonWalletRepository({Api api}) : _api = api;

  Future<SendMoneyToNonWalletResponse> sendMoneyToNonWallet(SendMoneyToNonWalletRequest request) async{
    SendMoneyToNonWalletResponse response = await _api.sendMoneyToNonWallet(request);
    return response;

  }

}