import 'package:beyondwallet/models/remote/login_model.dart';
import 'package:beyondwallet/models/remote/get_balance_model.dart';
import 'package:beyondwallet/services/api_services.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class GetBalanceRepository {
  final Api _api;

  GetBalanceRepository({Api api}) : _api = api;

  Future<GetBalanceResponse> getBalanceRequest() async{
    GetBalanceResponse response = await _api.getBalance();
    return response;
  }

}
