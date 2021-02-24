import 'package:beyondwallet/models/remote/is_wallet_exist_model.dart';
import 'package:beyondwallet/models/remote/get_balance_model.dart';
import 'package:beyondwallet/services/api_services.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class IsWalletExistRepository {
  final Api _api;

  IsWalletExistRepository({Api api}) : _api = api;

  Future<IsWalletExistResponse> isWalletExistRequest(IsWalletExistRequest request) async{
    IsWalletExistResponse response = await _api.isWalletExist(request);
    return response;
  }

}
