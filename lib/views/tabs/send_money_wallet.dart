import 'package:beyondwallet/helpers/contants.dart';
import 'package:beyondwallet/helpers/debouncer.dart';
import 'package:beyondwallet/models/local/alert_model.dart';
import 'package:beyondwallet/models/remote/get_balance_model.dart';
import 'package:beyondwallet/models/remote/is_wallet_exist_model.dart';
import 'package:beyondwallet/models/remote/send_money_wallet_model.dart';
import 'package:beyondwallet/models/remote/wallet_to_wallet_fee_model.dart';
import 'package:beyondwallet/repositories/get_balance_repository.dart';
import 'package:beyondwallet/utils/colors.dart';
import 'package:beyondwallet/utils/demins.dart';
import 'package:beyondwallet/utils/themes.dart';
import 'package:beyondwallet/viewModels/base_viewModel.dart';
import 'package:beyondwallet/viewModels/get_balnce_viewModel.dart';
import 'package:beyondwallet/viewModels/is_wallet_exist_viewModel.dart';
import 'package:beyondwallet/viewModels/send_money_wallet_viewModel.dart';
import 'package:beyondwallet/viewModels/wallet_to_wallet_fee_viewModel.dart';
import 'package:beyondwallet/views/components/base_widget.dart';
import 'package:beyondwallet/views/components/custom_button.dart';
import 'package:beyondwallet/views/components/snackbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SendMoneyWalletTab extends StatefulWidget {
  final String recentContactNumber;

  SendMoneyWalletTab({this.recentContactNumber});

  @override
  _SendMoneyWalletTabState createState() => _SendMoneyWalletTabState();
}

class _SendMoneyWalletTabState extends State<SendMoneyWalletTab> {
  bool includeFee = false;
  double mTransactionFee = 0.0;

  double newFee;
  bool reqId = false;
  bool req2FA = false;
  bool tAndC = false;
  bool userNotExist = false;
  bool userExist = false;
  String walletName = "";

  final _formKey = GlobalKey<FormState>();
  final _deBouncer = Debouncer(milliseconds: 2000);

  @override
  Widget build(BuildContext context) {
    SendMoneyToWalletRequest sendMoneyToWalletRequest =
        SendMoneyToWalletRequest();
    return BaseWidget<SendMoneyWalletViewModel>(
      model: SendMoneyWalletViewModel(
          sendMoneyWalletRepository: Provider.of(context)),
      builder: (context, model, child) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(kAppPadding),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    maxLength: 10,
                    autofocus: false,
                    initialValue: widget.recentContactNumber == null
                        ? ""
                        : widget.recentContactNumber,
                    decoration: InputDecoration(
                      counterText: '',
                      labelText: tr('Mobile Number'),
                    ),
                    validator: (input) =>
                        input.length == 10 ? null : tr("Number is not valid"),
                        onSaved: (input) {
                          sendMoneyToWalletRequest.receiverMobile = input;
                        },
                        onChanged: (value) {
                          if (value.length > 0) {
                            _deBouncer
                                .run(() =>
                                isWalletExist(value, context));
                          } else {
                            setState(() {
                              mTransactionFee = 0.0;
                            });
                          }
                        },
                        style: TextStyle(color: kEditTextColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                      child: Stack(
                        children: <Widget>[
                          Visibility(
                            visible: userExist,
                            child: Text("$walletName",style: appTheme.textTheme.body1.copyWith(color: kPrimaryColor),),
                          ),
                          Visibility(
                            visible: userNotExist,
                            child: Text("Wallet Do not Exist",style: appTheme.textTheme.body1.copyWith(color: kErrorRed),),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        maxLength: 10,
                        autofocus: false,
                        decoration: InputDecoration(
                            counterText: '',
                            labelText: tr('Amount'),
                            prefixText: "XOF : ",
                            prefixStyle: TextStyle(
                                color: kBlack, fontWeight: FontWeight.w600)),
                        validator: (input) =>
                        input.length > 0 ? null : "Amount is not valid",
                    onChanged: (value) {
                      if (value.length > 0) {
                        _deBouncer
                            .run(() => requestTransactionFee(value, context));
                      } else {
                        setState(() {
                          mTransactionFee = 0.0;
                        });
                      }
                    },
                    onSaved: (input) {
                      sendMoneyToWalletRequest.sendingAmount =
                          double.parse(input);
                    },
                    style: TextStyle(color: kEditTextColor),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    maxLines: 4,
                    autofocus: false,

                    decoration: InputDecoration(
                        counterText: '',
                        labelText: tr('Remark'),
                        alignLabelWithHint: true,
                        contentPadding: const EdgeInsets.all(16.0)),
                    validator: (input) =>
                        input.length > 0 ? null : tr("Remark is not valid"),
                    onSaved: (input) {
                      sendMoneyToWalletRequest.note = input;
                    },
                    style: TextStyle(color: kEditTextColor),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 20,
                        height: 20,
                        child: Checkbox(
                          activeColor: kPrimaryColor,
                          value: tAndC,
                          onChanged: (value) {
                            setState(() {
                              tAndC = !tAndC;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 8.0),
                      RichText(
                        text: TextSpan(
                          text: tr('I have read the'),
                          style: appTheme.textTheme.display3,
                          children: <TextSpan>[
                            TextSpan(
                                text: tr('Terms and Conditions'),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 20,
                        height: 20,
                        child: Checkbox(
                          activeColor: kPrimaryColor,
                          value: includeFee,
                          onChanged: (value) {
                            setState(() {
                              includeFee = !includeFee;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        tr('Receiver pays transaction fees'),
                        style: appTheme.textTheme.display3,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CustomButton(
                          child: model.loadingState == LoadingState.loading
                              ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white))
                              : Text(
                                  tr("Send"),
                                  textAlign: TextAlign.center,
                                  style: appTheme.textTheme.button,
                                ),
                          width: double.infinity,
                          height: 60,
                          onPressed: () {
                            _removeFocus(context);
                            if (tAndC == true) {
                              if (!_formKey.currentState.validate()) {
                                return;
                              } else {
                                _formKey.currentState.save();
                                if (includeFee == true) {
                                  sendMoneyToWalletRequest.isInclusive=true;
                                  newFee =
                                      sendMoneyToWalletRequest.sendingAmount;
                                  print(sendMoneyToWalletRequest);
                                  _showConfirmation(
                                      model, sendMoneyToWalletRequest);
                                } else {
                                  sendMoneyToWalletRequest.isInclusive =false;
                                  print(sendMoneyToWalletRequest);
                                  newFee =
                                      sendMoneyToWalletRequest.sendingAmount +
                                          mTransactionFee;
                                  print(newFee);
                                  _showConfirmation(
                                      model, sendMoneyToWalletRequest);
                                }
                              }
                            } else {
                              showSnackBar(
                                context: context,
                                message: tr("Agree to the Terms and Condition"),
                              );
                            }
                          }),
                      buildFeeWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _removeFocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void isWalletExist(String value,BuildContext context) {
    IsWalletExistRequest isWalletExistRequest = IsWalletExistRequest(mobile: value);
    IsWalletExistViewModel isWalletExistViewModel = IsWalletExistViewModel(
      isWalletExistRepository: Provider.of(context));
    isWalletExistViewModel.isWalletExistRequest(isWalletExistRequest).then((_)=>onWalletExistResponse(isWalletExistViewModel));

  }
  void onWalletExistResponse(IsWalletExistViewModel model){
    if (model.loadingState == LoadingState.loaded) {
      if (model.failure != null) {
        showSnackBar(context: context, message: model.failure.message);
      } else {
        if (model.getUser.status == 1) {
          setState(() {
            walletName = model.getUser.user.name +" "+ model.getUser.user.lastName;
            userExist= true;
            userNotExist = false;
          });
        }
        else if(model.getUser.status == 0){
          setState(() {
            userNotExist= true;
            userExist = false;
          });
        }
        else {
          showSnackBar(context: context, message: tr("Something Went wrong"),);
        }
      }
    }
  }

  void requestTransactionFee(String value, BuildContext context) {
    if (double.parse(value) > Constants.balance) {
      showSnackBar(
        context: context,
        message: tr("Not enough balance available"),
      );
    } else {
      WalletToWalletFeeRequest walletToWalletFeeRequest =
          WalletToWalletFeeRequest(amount: double.parse(value));
      WalletToWalletFeeViewModel walletToWalletFeeViewModel =
          WalletToWalletFeeViewModel(
              walletToWalletFeeRepository: Provider.of(context));
      walletToWalletFeeViewModel
          .checkWalletToWalletFee(walletToWalletFeeRequest)
          .then((_) => onTransactionFeeResponse(walletToWalletFeeViewModel));
    }
  }

  Widget buildFeeWidget() {
    return Container(
      width: double.infinity,
      child: Text(
        "Total charge XOF $mTransactionFee will be charged",
        style: appTheme.textTheme.display3.copyWith(fontSize: 12),
      ),
    );
  }

  void onSendMoneyResponse(SendMoneyWalletViewModel model) {
    GetBalanceRepository repo = GetBalanceRepository();
    GetBalanceViewModel refreshBalance =
        GetBalanceViewModel(getBalanceRepository: Provider.of(context));
    if (model.loadingState == LoadingState.loaded) {
      if (model.failure != null) {
        showSnackBar(context: context, message: model.failure.message);
      } else {
        if (model.sendMoneyToWalletData.status == 1) {
          refreshBalance
              .getBalanceRequest()
              .then((_) => onWalletBalanceResponse(refreshBalance));
          _formKey.currentState.reset();
          AlertRequest alertRequest = AlertRequest(
            title: "Transaction completed",
            description: tr("Do you want to do another transaction?"),
            buttonTitle: tr("yes"),
          );
          _showDialog(alertRequest);
        } else {
          showSnackBar(
              context: context, message: model.sendMoneyToWalletData.error);
        }
      }
    }
  }

  void onWalletBalanceResponse(GetBalanceViewModel model) {
    if (model.loadingState == LoadingState.loaded) {
      if (model.failure != null) {
        showSnackBar(context: context, message: model.failure.message);
      } else {
        if (model.getBalance.status == 1) {
          Constants.balance = model.getBalance.balance;
        } else {
          showSnackBar(
            context: context,
            message: tr("Something Went wrong"),
          );
        }
      }
    }
  }

  onTransactionFeeResponse(WalletToWalletFeeViewModel model) {
    if (model.loadingState == LoadingState.loaded) {
      if (model.failure != null) {
        showSnackBar(context: context, message: model.failure.message);
      } else {
        if (model.getFee.status == 1) {
          setState(() {
            mTransactionFee = model.getFee.fee;
          });
        } else {
          showSnackBar(
            context: context,
            message: tr("Something Went wrong"),
          );
        }
      }
    }
  }

  void _showDialog(AlertRequest alertRequest) {
    showDialog(
      context: context,
      builder: (BuildContext localContext) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(alertRequest.title),
          content: new Text(alertRequest.description),
          actions: <Widget>[
            new FlatButton(
              child: new Text(
                tr("Yes"),
              ),
              onPressed: () {
                Navigator.of(localContext).pop();
              },
            ),
            new FlatButton(
              child: new Text(
                tr("Go to dashboard"),
              ),
              onPressed: () {
                Navigator.of(localContext).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<Null> _showConfirmation(SendMoneyWalletViewModel model,
      SendMoneyToWalletRequest sendMoneyToWalletRequest) async {
    double recipientAmount = newFee - mTransactionFee;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop:() async => false,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              title: Text(
                tr("Transaction Info"),
                textAlign: TextAlign.center,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: 150,
                          child: Text(
                            tr("Amount"),
                            style: appTheme.textTheme.body1,
                          )),
                      Text(":",
                          style: appTheme.textTheme.body1,
                          textAlign: TextAlign.center),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "$newFee",
                        style: appTheme.textTheme.body1
                            .copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: 150,
                          child: Text(
                            tr("Fee"),
                            style: appTheme.textTheme.body1,
                          )),
                      Text(":",
                          style: appTheme.textTheme.body1,
                          textAlign: TextAlign.center),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "$mTransactionFee",
                        style: appTheme.textTheme.body1
                            .copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: 150,
                          child: Text(
                            tr("Recipient recieved"),
                            style: appTheme.textTheme.body1,
                          )),
                      Text(
                        ":",
                        style: appTheme.textTheme.body1,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("$recipientAmount",
                          style: appTheme.textTheme.body1
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center)
                    ],
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        child: Text(tr("Cancel"),
                            textAlign: TextAlign.center,
                            style: appTheme.textTheme.body1
                                .copyWith(color: Colors.red)),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      CustomButton(
                        width: 150,
                        child: model.loadingState == LoadingState.loading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white))
                            : Text(
                                tr("Proceed"),
                                textAlign: TextAlign.center,
                                style: appTheme.textTheme.button,
                              ),
                        onPressed: () {
                          model
                              .sendMoneyToWallet(sendMoneyToWalletRequest)
                              .then((_) => onSendMoneyResponse(model));
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
