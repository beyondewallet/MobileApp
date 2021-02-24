import 'package:auto_route/auto_route.dart';
import 'package:beyondwallet/models/remote/select_bank_model.dart';
import 'package:beyondwallet/routes/router.gr.dart';
import 'package:beyondwallet/utils/colors.dart';
import 'package:beyondwallet/utils/themes.dart';
import 'package:beyondwallet/viewModels/bank_viewmodel.dart';
import 'package:beyondwallet/viewModels/base_viewModel.dart';
import 'package:beyondwallet/viewModels/user_details_viewModel.dart';
import 'package:beyondwallet/views/components/appbar.dart';
import 'package:beyondwallet/views/components/base_widget.dart';
import 'package:beyondwallet/views/components/custom_button.dart';
import 'package:beyondwallet/views/components/snackbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/themes.dart';

class DocumentPage extends StatefulWidget {
  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(tr("Documents"), showBalance: false),
        body: BaseWidget<UserDetailsViewModel>(
          model: UserDetailsViewModel(userDetailsRepository: Provider.of(context)),
          onModelReady: (model) => model.fetchUserDetails(),
          builder: (context, model, child) => model.loadingState ==
              LoadingState.loading
              ? Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor)))
              : onUserDetailsResponse(model),
        ));
  }

  Widget _buildDocumentList(UserDetailsViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  itemCount: model.userDetailsData.user.docsHash.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "http://91d90ac373dc.sn.mynetname.net:2020/ipfs/${model.userDetailsData.user.docsHash[index].id}")
                          )
                        ),
                      )
                    );
                  },
                ),
              ),
              CustomButton(
                child: Text(
                  tr("Login"),
                  textAlign: TextAlign.center,
                  style: appTheme.textTheme.body1,
                ),
                width: MediaQuery.of(context).size.width,
                height: 60,
                onPressed: () => gotoActivationPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onUserDetailsResponse(UserDetailsViewModel model) {
    if (model.failure != null) {
      return InkWell(
          onTap: () {
            model.fetchUserDetails();
          },
          child: Text(tr("Unable to load data, Tap to try again"),),);
    } else {
      if (model.userDetailsData.status == 1) {
        return _buildDocumentList(model);
      } else {
        return InkWell(
            onTap: () {
              model.fetchUserDetails();
            },
            child: Text(tr("Unable to load data, Tap to try again"),),);
      }
    }
  }
  void gotoActivationPage() {
    ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.activationPendingPage);
  }
}
