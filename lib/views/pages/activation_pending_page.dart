import 'package:auto_route/auto_route.dart';
import 'package:beyondwallet/helpers/contants.dart';
import 'package:beyondwallet/helpers/loactor.dart';
import 'package:beyondwallet/models/local/alert_model.dart';
import 'package:beyondwallet/routes/router.gr.dart';
import 'package:beyondwallet/services/sharedprefs_services.dart';
import 'package:beyondwallet/utils/themes.dart';
import 'package:beyondwallet/viewModels/base_viewModel.dart';
import 'package:beyondwallet/viewModels/user_details_viewModel.dart';
import 'package:beyondwallet/views/components/appbar.dart';
import 'package:beyondwallet/views/components/base_widget.dart';
import 'package:beyondwallet/views/components/custom_button.dart';
import 'package:beyondwallet/views/components/snackbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActivationPendingPage extends StatefulWidget {
  @override
  _ActivationPendingPageState createState() => _ActivationPendingPageState();
}

class _ActivationPendingPageState extends State<ActivationPendingPage> {
  var _mSharedPrefs = locator<SharedPrefsService>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<UserDetailsViewModel>(
      model: UserDetailsViewModel(userDetailsRepository: Provider.of(context)),
      builder: (context, model, child) => Scaffold(
        appBar: appBar(
          Constants.userBankName,
          showBalance: false,
          automaticallyImplyLeadingValue: false,
          showLogoutButton: true,
          widget: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.exit_to_app),
            ),
            onTap: () {
              AlertRequest alertRequest = AlertRequest(
                title: tr("Logout"),
                description: tr("Are you sure?"),
                buttonTitle: tr("yes"),
              );
              _showDialog(alertRequest);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Spacer(),
              Text("Hi Welcome",
                style: appTheme.textTheme.title.copyWith(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 24,
              ),
              Text("Account is not activated yet, Please visit nearest bank branch or partner.",
                style: appTheme.textTheme.title.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Container(
                child: CustomButton(
                    child: model.loadingState == LoadingState.loading
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white))
                        : Text(
                            tr("Check Activation Status"),
                            textAlign: TextAlign.center,
                            style: appTheme.textTheme.button,
                          ),
                    width: double.infinity,
                    height: 60,
                    onPressed: () {
                      model.fetchUserDetails().then((_) => checkStatus(model));
                    }),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  checkStatus(UserDetailsViewModel model) {
    if (model.failure != null) {
      showSnackBar(context: context, message: model.failure.message);
    } else {
      if (model.userDetailsData.user.status == 1) {
        showSnackBar(context: context, message: "Account is activated, Thank you");
        Future.delayed(Duration(seconds: 2), () {
          ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
              Routes.rootPage, (Route<dynamic> route) => false);
        });
      } else if (model.userDetailsData.user.status == 2) {
        ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
            Routes.bankPage, (Route<dynamic> route) => false);
      } else if (model.userDetailsData.user.status == 3) {
        showSnackBar(context: context, message: "Account not activated yet");
      } else if (model.userDetailsData.user.status == 4) {
        showSnackBar(context: context, message: "Account not activated yet");
      } else {
        showSnackBar(
            context: context, message: "Something went wrong, try again");
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
                _mSharedPrefs.clear();
                gotoLoginPage();
              },
            ),
            new FlatButton(
              child: new Text(
                tr("Close"),
              ),
              onPressed: () {
                Navigator.of(localContext).pop();
              },
            ),
          ],
        );
      },
    );
  }


  void gotoLoginPage() {
    ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
        Routes.loginPage, (Route<dynamic> route) => false);
  }
}
