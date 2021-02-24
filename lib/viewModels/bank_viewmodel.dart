import 'package:beyondwallet/models/remote/select_bank_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:beyondwallet/repositories/bank_repository.dart';
import 'package:beyondwallet/helpers/error_handling.dart';
import 'package:beyondwallet/models/remote/login_model.dart';

import 'base_viewModel.dart';

class BankViewModel extends BaseViewModel{
  BankRepository _bankRepository;
  BankListResponse _bankListResponse;
  AssignBankResponse _assignBankResponse;


  BankListResponse get bankList => _bankListResponse;
  AssignBankResponse get bank=> _assignBankResponse;

  BankViewModel({@required BankRepository bankRepository})
      : _bankRepository = bankRepository;

  void _setBanKList(BankListResponse bankListResponse) {
    _bankListResponse = bankListResponse;
    print(bankListResponse);
  }
  void _setBank(AssignBankResponse assignBankResponse) {
    _assignBankResponse = assignBankResponse;
    print(assignBankResponse);
  }


  Future fetchBankList() async {
    setFailure(null);
    _setBanKList(null);
    setLoadingState(LoadingState.loading);
    try {
      final success = await _bankRepository.getBankListRequest();
      _setBanKList(success);
    } on Failure catch (f) {
      setFailure(f);
    }
    setLoadingState(LoadingState.loaded);
  }


  Future assignBank(AssignBankRequest assignBankRequest) async {
    setFailure(null);
    _setBank(null);
    setLoadingState(LoadingState.loading);
    try {
      final assigned = await _bankRepository.assignBank(assignBankRequest);
      _setBank(assigned);
    } on Failure catch (f) {
      setFailure(f);
    }
    setLoadingState(LoadingState.loaded);
  }
}
