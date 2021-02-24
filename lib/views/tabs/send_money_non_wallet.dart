import 'package:beyondwallet/helpers/contants.dart';
import 'package:beyondwallet/helpers/debouncer.dart';
import 'package:beyondwallet/models/local/alert_model.dart';
import 'package:beyondwallet/models/remote/send_money_non_wallet_model.dart';
import 'package:beyondwallet/models/remote/wallet_to_non_wallet_model.dart';
import 'package:beyondwallet/repositories/get_balance_repository.dart';
import 'package:beyondwallet/utils/colors.dart';
import 'package:beyondwallet/utils/demins.dart';
import 'package:beyondwallet/utils/themes.dart';
import 'package:beyondwallet/viewModels/base_viewModel.dart';
import 'package:beyondwallet/viewModels/get_balnce_viewModel.dart';
import 'package:beyondwallet/viewModels/send_money_non_wallet_viewModel.dart';
import 'package:beyondwallet/viewModels/wallet_to_non_wallet_fee_viewModel.dart';
import 'package:beyondwallet/views/components/base_widget.dart';
import 'package:beyondwallet/views/components/custom_button.dart';
import 'package:beyondwallet/views/components/snackbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SendMoneyNonWalletTab extends StatefulWidget {
  @override
  _SendMoneyNonWalletTabState createState() => _SendMoneyNonWalletTabState();
}

class _SendMoneyNonWalletTabState extends State<SendMoneyNonWalletTab> {

  bool includeFee = false;
  double mTransactionFee = 0.0;
  double newFee;
  bool reqId = false;
  bool reqOTP = false;
  bool tAndC = false;

  final _formKey = GlobalKey<FormState>();
  final _deBouncer = Debouncer(milliseconds: 2000);

  @override
  Widget build(BuildContext context) {
    WalletToNonWalletFeeRequest walletToNonWalletFeeRequest =
    WalletToNonWalletFeeRequest();
    SendMoneyToNonWalletRequest sendMoneyToNonWalletRequest =
    SendMoneyToNonWalletRequest();
    return BaseWidget<SendMoneyNonWalletViewModel>(
      model: SendMoneyNonWalletViewModel(
          sendMoneyNonWalletRepository: Provider.of(context)),
      builder: (context, model, child) =>
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(kAppPadding),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        maxLength: 10,
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: tr('Mobile Number'),
                        ),
                        validator: (input) =>
                        input.length == 10 ? null : tr("Number is not valid"),
                        onSaved: (input) {
                          sendMoneyToNonWalletRequest.receiverMobile = input;
                        },
                        style: TextStyle(color: kEditTextColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: tr('Given Name*'),
                        ),
                        validator: (input) =>
                        input.isEmpty ? tr("Name is not valid") : null,
                        onSaved: (input) {
                          sendMoneyToNonWalletRequest.receiverGivenName = input;
                        },
                        style: TextStyle(color: kEditTextColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: tr('Family Name*'),
                        ),
                        validator: (input) =>
                        input.isEmpty ? tr("Name is not valid") : null,
                        onSaved: (input) {
                          sendMoneyToNonWalletRequest.receiverFamilyName =
                              input;
                        },
                        style: TextStyle(color: kEditTextColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: tr('State'),
                        ),
                        validator: (input) =>
                        input.isEmpty ? tr("State is not valid") : null,
                        onSaved: (input) {},
                        style: TextStyle(color: kEditTextColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        maxLength: 6,
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: tr('Zip Code'),
                        ),
                        validator: (input) =>
                        input.isEmpty ? tr("ZipCode is not valid") : null,
                        onSaved: (input) {},
                        style: TextStyle(color: kEditTextColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: tr('Country*'),
                        ),
                        validator: (input) =>
                        input.isEmpty ? tr("Country is not valid") : null,
                        onSaved: (input) {
                          sendMoneyToNonWalletRequest.receiverCountry = input;
                        },
                        style: TextStyle(color: kEditTextColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 1,
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: tr('Authorised email Id'),
                        ),
                        validator: (input) =>
                        input.contains("@") ? null : tr("Email is not valid"),
                        onSaved: (input) {
                          sendMoneyToNonWalletRequest.receiverEmail = input;
                        },
                        style: TextStyle(color: kEditTextColor),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
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
                                    value: reqId,
                                    onChanged: (value) {
                                      sendMoneyToNonWalletRequest.withoutId =
                                      "0";
                                      setState(() {
                                        reqId = !reqId;
                                      });
                                    },
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text:tr('Require ID'),
                                    style: appTheme.textTheme.display3,
                                  ),
                                ),
                              ],
                            ),
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
                                    value: reqOTP,
                                    onChanged: (value) {
                                      sendMoneyToNonWalletRequest.requireOtp =
                                      "0";
                                      setState(() {
                                        reqOTP = !reqOTP;
                                      });
                                    },
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: tr('Require OTP verification'),
                                    style: appTheme.textTheme.display3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            child: Text(
                              tr("Receiver's Identification"),
                              style: appTheme.textTheme.display1.copyWith(
                                  color: kBlack,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: 'Country',
                          hintText: "country"
                        ),
                        validator: (input) =>
                        input.isEmpty ? tr("Country is not valid") : null,
                        onSaved: (input) {
                          sendMoneyToNonWalletRequest.receiverCountry = input;
                        },
                        style: TextStyle(color: kEditTextColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: tr('Type'),
                        ),
                        validator: (input) =>
                        input.isEmpty ? tr("Type is not valid") : null,
                        onSaved: (input) {
                          sendMoneyToNonWalletRequest
                              .receiverIdentificationType =
                              input;
                        },
                        style: TextStyle(color: kEditTextColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: tr('Number'),
                        ),
                        validator: (input) =>
                        input.isEmpty ? tr("Number is not valid") : null,
                        onSaved: (input) {
                          sendMoneyToNonWalletRequest
                              .receiverIdentificationNumber =
                              input;
                        },
                        style: TextStyle(color: kEditTextColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        maxLength: 10,
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: tr('Valid Till'),
                        ),
                        validator: (input) =>
                        input.length == 5 ? null : tr("Date is not valid"),
                        onSaved: (input) {
                          sendMoneyToNonWalletRequest
                              .receiverIdentificationValidTill = input;
                        },
                        style: TextStyle(color: kEditTextColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        decoration: InputDecoration(
                            counterText: '',
                            labelText: tr('Amount'),
                            prefixText: "XOF : ",
                            prefixStyle: TextStyle(
                                color: kBlack, fontWeight: FontWeight.w600)),
                        validator: (input) =>
                        input.isEmpty ? tr("Amount is not valid") : null,
                        onChanged: (value) {
                          if (value.length > 0) {
                            _deBouncer
                                .run(() =>
                                requestTransactionFee(value, context));
                          } else {
                            setState(() {
                              mTransactionFee = 0.0;
                            });
                          }
                        },
                        onSaved: (input) {
                          sendMoneyToNonWalletRequest.sendingAmount =
                              double.parse(input);
                        },
                        style: TextStyle(color: kEditTextColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        maxLines: 7,
                        decoration: InputDecoration(
                            counterText: '',
                            labelText: tr('Remark'),
                            alignLabelWithHint: true,
                            contentPadding: const EdgeInsets.all(16.0)),
                        validator: (input) =>
                        input.isEmpty ? tr("Remark is not valid") : null,
                        onSaved: (input) {
                          sendMoneyToNonWalletRequest.note = input;
                        },
                        style: TextStyle(color: kEditTextColor),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Checkbox(
                          activeColor: kPrimaryColor,
                          value: tAndC,
                          onChanged: (value) {
                            setState(() {
                              tAndC = !tAndC;
                            });
                          },
                        ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Checkbox(
                          activeColor: kPrimaryColor,
                          value: includeFee,
                          onChanged: (value) {
                            setState(() {
                              includeFee = !includeFee;
                            });
                          },
                        ),
                        Text(tr('Receiver pays transaction fees'),
                          style: appTheme.textTheme.display3,
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Column(
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
                              if (tAndC == true) {
                                if (!_formKey.currentState.validate()) {
                                  return;
                                } else {
                                  _removeFocus(context);
                                  _formKey.currentState.save();
                                  if (includeFee == true) {
                                    sendMoneyToNonWalletRequest.isInclusive = true;
                                    newFee = sendMoneyToNonWalletRequest.sendingAmount;
                                    print(sendMoneyToNonWalletRequest);
                                    _showConfirmation(model,sendMoneyToNonWalletRequest);
                                  } else {
                                    sendMoneyToNonWalletRequest.isInclusive = false;
                                    print(sendMoneyToNonWalletRequest);
                                    newFee =
                                        sendMoneyToNonWalletRequest
                                            .sendingAmount +
                                            mTransactionFee;
                                    print(newFee);
                                    _showConfirmation(model,sendMoneyToNonWalletRequest);
                                  }
                                }
                              } else {
                                showSnackBar(
                                    context: context,
                                    message: tr("Agree to the Terms and Condition"),);
                              }
                            }),
                        buildFeeWidget(),
                      ],
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

  void onSendMoneyResponse(SendMoneyNonWalletViewModel model) {
    GetBalanceRepository repo = GetBalanceRepository();
    GetBalanceViewModel refreshBalance = GetBalanceViewModel(
        getBalanceRepository: Provider.of(context));
    if (model.loadingState == LoadingState.loaded) {
      if (model.failure != null) {
        showSnackBar(context: context, message: model.failure.message);
      } else {
        if (model.sendMoneyToNonWalletData.status == 1) {
          refreshBalance
              .getBalanceRequest()
              .then((_) => onWalletBalanceResponse(refreshBalance));
          _formKey.currentState.reset();
          AlertRequest alertRequest = AlertRequest(title: tr("Transaction completed"),
              description: tr("Do you want to do another transaction?"),
              buttonTitle: tr("yes"),);
          _showDialog(alertRequest);
          showSnackBar(
              context: context, message: tr("Amount transfered sucessfully"),);
        } else {
          showSnackBar(
              context: context, message: model.sendMoneyToNonWalletData.error);
        }
      }
    }
  }

  void requestTransactionFee(String value, BuildContext context) {
    if (double.parse(value) > Constants.balance) {
      showSnackBar(context: context, message: tr("Not enough balance amount"),);
    } else {
      WalletToNonWalletFeeRequest walletToWalletFeeRequest =
      WalletToNonWalletFeeRequest(amount: double.parse(value));
      WalletToNonWalletFeeViewModel walletToWalletFeeViewModel =
      WalletToNonWalletFeeViewModel(
          walletToNonWalletFeeRepository: Provider.of(context));
      walletToWalletFeeViewModel
          .checkWalletToNonWalletFee(walletToWalletFeeRequest)
          .then((_) => onTransactionFeeResponse(walletToWalletFeeViewModel));
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
          showSnackBar(context: context, message: tr("Something Went wrong"),);
        }
      }
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

  onTransactionFeeResponse(WalletToNonWalletFeeViewModel model) {
    if (model.loadingState == LoadingState.loaded) {
      if (model.failure != null) {
        showSnackBar(context: context, message: model.failure.message);
      } else {
        if (model.getFee.status == 1) {
          setState(() {
            mTransactionFee = model.getFee.fee;
          });
        } else {
          showSnackBar(context: context, message: tr("Something Went wrong"),);
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
              child: new Text(tr("Yes")),
              onPressed: () {
                Navigator.of(localContext).pop();
              },
            ), new FlatButton(
              child: new Text(tr("Go to dashboard"),),
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
  void _showConfirmation(SendMoneyNonWalletViewModel model,SendMoneyToNonWalletRequest sendMoneyToWalletRequest){
    double recipientAmount = newFee - mTransactionFee;
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: Text(tr("Transaction Info"),textAlign: TextAlign.center,),
            content: Container(
              height: 250,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(width:150,child: Text(tr("Amount"),style: appTheme.textTheme.body1,)),
                      Text(":",style: appTheme.textTheme.body1,textAlign: TextAlign.center),
                      SizedBox(width: 20,),
                      Text("$newFee",style: appTheme.textTheme.body1.copyWith(fontWeight: FontWeight.bold),)
                    ],
                  ),
                  SizedBox(
                      height: 10
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(width:150,child: Text(tr("Fee"),style: appTheme.textTheme.body1,)),
                      Text(":",style: appTheme.textTheme.body1,textAlign: TextAlign.center),
                      SizedBox(width: 20,),
                      Text("$mTransactionFee",style: appTheme.textTheme.body1.copyWith(fontWeight: FontWeight.bold),)
                    ],
                  ),
                  SizedBox(
                      height: 10
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(width:150,child: Text(tr("Recipient recieved"),style: appTheme.textTheme.body1,)),
                      Text(":",style: appTheme.textTheme.body1,),
                      SizedBox(width: 20,),
                      Text("$recipientAmount",style: appTheme.textTheme.body1.copyWith(fontWeight: FontWeight.bold),textAlign: TextAlign.center)
                    ],
                  ),
                  SizedBox(
                      height: 50
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        child: Text(tr("Cancel"), textAlign: TextAlign.center,
                            style: appTheme.textTheme.body1.copyWith(color: Colors.red)),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: 30,),
                      CustomButton(
                        width: 150,
                        child: model.loadingState == LoadingState.loading
                            ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white))
                            : Text(
                          tr("Proceed"),
                          textAlign: TextAlign.center,
                          style: appTheme.textTheme.button,
                        ),
                        onPressed: (){
                          model
                              .sendMoneyToNonWallet(
                              sendMoneyToWalletRequest)
                              .then((_) =>
                              onSendMoneyResponse(model));
                          Navigator.of(context).pop();
                        },

                      )
                    ],)
                ],
              ),
            ),
          );
        }
    );
  }
}
