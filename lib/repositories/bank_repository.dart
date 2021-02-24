import 'package:beyondwallet/models/remote/login_model.dart';
import 'package:beyondwallet/models/remote/select_bank_model.dart';
import 'package:beyondwallet/services/api_services.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class BankRepository {
  final Api _api;

  BankRepository({Api api}) : _api = api;

  Future<BankListResponse> getBankListRequest() async{
    BankListResponse response = await _api.bankList();
   return response;
  }

  Future<AssignBankResponse> assignBank(AssignBankRequest assignBankRequest) async{
    AssignBankResponse response = await _api.assignBank(assignBankRequest);
    return response;
  }

}
