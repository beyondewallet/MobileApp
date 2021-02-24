import 'package:beyondwallet/models/remote/get_transaction_history_model.dart';
import 'package:beyondwallet/services/api_services.dart';
import 'dart:async';

class GetTransactionHistoryRepository {
  final Api _api;

  GetTransactionHistoryRepository({Api api}) : _api = api;

  Future<GetTransactionHistoryResponse> getTransactionHistoryRequest() async{
    print("hello");
    GetTransactionHistoryResponse response = await _api.getTransactionHistory();
    return response;
  }

}