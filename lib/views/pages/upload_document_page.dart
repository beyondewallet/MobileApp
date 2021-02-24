import 'package:auto_route/auto_route.dart';
import 'package:beyondwallet/helpers/loactor.dart';
import 'package:beyondwallet/models/local/alert_model.dart';
import 'package:beyondwallet/routes/router.gr.dart';
import 'package:beyondwallet/services/sharedprefs_services.dart';
import 'package:beyondwallet/utils/colors.dart';
import 'package:beyondwallet/utils/demins.dart';
import 'package:beyondwallet/utils/themes.dart';
import 'package:beyondwallet/viewModels/base_viewModel.dart';
import 'package:beyondwallet/viewModels/upload_document_viewModel.dart';
import 'package:beyondwallet/views/components/appbar.dart';
import 'package:beyondwallet/views/components/base_widget.dart';
import 'package:beyondwallet/views/components/custom_button.dart';
import 'package:beyondwallet/views/components/snackbar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UploadDocumentsPage extends StatefulWidget {
  @override
  _UploadDocumentsPageState createState() => _UploadDocumentsPageState();
}

class _UploadDocumentsPageState extends State<UploadDocumentsPage> {

  String dropdownValue1 = 'Voter card';
  String dropdownValue2 = 'National Id card';
  String dropdownValue3 = 'Identity card 1';
  String dropdownValue4 = 'Identity card 2';

  var _mSharedPrefs = locator<SharedPrefsService>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      model: UploadDocumentViewModel(
          uploadDocumentRepository: Provider.of(context)),
      builder: (context, model, child) => Scaffold(
        appBar: appBar(
          tr(
            "Upload Document",
          ),
          showLogoutButton: true,
          showBalance: false,
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
        body: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(kAppPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      buildDropdown(dropdownValue1),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: AspectRatio(
                          aspectRatio: 3 / 2,
                          child: DottedBorder(
                            strokeWidth: 2.0,
                            dashPattern: [6],
                            borderType: BorderType.RRect,
                            radius: Radius.circular(5),
                            padding: EdgeInsets.all(6),
                            color: kPrimaryColor,
                            child: InkWell(
                              onTap: () => _openImagePickerModal(context, 0, model),
                              child: Container(
                                alignment: Alignment.center,
                                child: model.panFrontImageFile == null
                                    ? Image.asset(
                                        'assets/images/upload.png',
                                        height: 90.0,
                                        width: 90.0,
                                      )
                                    : Image.file(model.panFrontImageFile,
                                        fit: BoxFit.fill),
                              ),
                            ),
                          ),
                        ),
                      ),
                      buildDropdown(dropdownValue2),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: AspectRatio(
                          aspectRatio: 3 / 2,
                          child: DottedBorder(
                            strokeWidth: 2.0,
                            dashPattern: [6],
                            borderType: BorderType.RRect,
                            radius: Radius.circular(5),
                            padding: EdgeInsets.all(6),
                            color: kPrimaryColor,
                            child: InkWell(
                              onTap: () => _openImagePickerModal(context, 1, model),
                              child: Container(
                                alignment: Alignment.center,
                                child: model.panHandHeldImageFile == null
                                    ? Image.asset(
                                        'assets/images/upload.png',
                                        height: 90.0,
                                        width: 90.0,
                                      )
                                    : Image.file(model.panHandHeldImageFile,
                                        fit: BoxFit.fill),
                              ),
                            ),
                          ),
                        ),
                      ),
                      buildDropdown(dropdownValue3),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: AspectRatio(
                          aspectRatio: 3 / 2,
                          child: DottedBorder(
                            strokeWidth: 2.0,
                            dashPattern: [6],
                            borderType: BorderType.RRect,
                            radius: Radius.circular(5),
                            padding: EdgeInsets.all(6),
                            color: kPrimaryColor,
                            child: InkWell(
                              onTap: () => _openImagePickerModal(context, 2, model),
                              child: Container(
                                alignment: Alignment.center,
                                child: model.identityDocFrontImageFile == null
                                    ? Image.asset(
                                  'assets/images/upload.png',
                                  height: 90.0,
                                  width: 90.0,
                                )
                                    : Image.file(model.identityDocFrontImageFile,
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                        ),
                      ),
                      buildDropdown(dropdownValue4),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: AspectRatio(
                          aspectRatio: 3 / 2,
                          child: DottedBorder(
                            strokeWidth: 2.0,
                            dashPattern: [6],
                            borderType: BorderType.RRect,
                            radius: Radius.circular(5),
                            padding: EdgeInsets.all(6),
                            color: kPrimaryColor,
                            child: InkWell(
                              onTap: () => _openImagePickerModal(context, 3, model),
                              child: Container(
                                alignment: Alignment.center,
                                child: model.identityDocBackImageFile == null
                                    ? Image.asset(
                                  'assets/images/upload.png',
                                  height: 90.0,
                                  width: 90.0,
                                )
                                    : Image.file(model.identityDocBackImageFile,
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildNextButton(model, context),
            ),
            InkWell(
                onTap: () => onNextSkipClick(model),
                child: Text(
                  tr("skip for now"),
                  style: TextStyle(color: Colors.grey),
                )),
          ],
        ),
      ),
    );
  }

  Widget buildDropdown(String dropdownValue){
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      underline: Container(
        height: 2,
        color: Colors.grey,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Voter card', 'National Id card','Identity card 1','Identity card 2']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      })
          .toList(),
    );
  }

  buildNextButton(UploadDocumentViewModel model, BuildContext context) {
    return CustomButton(
      child: model.loadingState == LoadingState.loading
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : Text(
              tr("Upload"),
              textAlign: TextAlign.center,
              style: appTheme.textTheme.button,
            ),
      width: MediaQuery.of(context).size.width,
      height: 60,
      onPressed: () => model.loadingState == LoadingState.loading
          ? null
          : onNextButtonClick(model),
    );
  }

  void onNextButtonClick(UploadDocumentViewModel model) {
    model
        .uploadDocument(model.uploadDocumentList[0])
        .then((_) => onUploadDocumentResponse(model));
  }

  void onUploadDocumentResponse(UploadDocumentViewModel model) {
    if (model.loadingState == LoadingState.loaded) {
      if (model.failure != null) {
        var errorMessage =
            model.failure.message ?? tr("sever is not sending error message");
        showSnackBar(context: context, message: errorMessage);
      } else {
        if (model.uploadDocumentResponse.status == 1) {
          showSnackBar(
              context: context, message: model.uploadDocumentResponse.message);
          Future.delayed(Duration(seconds: 2), () {
            gotoActivationPage();
          });
        } else {
          showSnackBar(
              context: context, message: model.uploadDocumentResponse.message);
        }
      }
    }
  }

  void _openImagePickerModal(
      BuildContext pageContext, int index, UploadDocumentViewModel model) {
    showModalBottomSheet(
        context: pageContext,
        builder: (BuildContext context) {
          return Container(
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.all(Radius.circular(15)),
            ),
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text(
                  tr('Pick an image'),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: kPrimaryColor),
                ),
                SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                  child: Text(
                    tr('Use Camera'),
                  ),
                  onPressed: () {
                    model
                        .getImage(ImageSource.camera, index)
                        .then((bool isFileCaptured) {
                      if (!isFileCaptured)
                        showSnackBar(
                          context: pageContext,
                          message: tr('Image Capture failed, please try again'),
                        );
                    });
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text(
                    tr('Use Gallery'),
                  ),
                  onPressed: () {
                    model
                        .getImage(ImageSource.gallery, index)
                        .then((bool isFileCaptured) {
                      if (!isFileCaptured)
                        showSnackBar(
                          context: pageContext,
                          message: tr('Image Capture failed, please try again'),
                        );
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  void onNextSkipClick(UploadDocumentViewModel model) {
    model.skipUploadDocument().then((_) => onSkipUploadDocumentResponse(model));
  }

  void onSkipUploadDocumentResponse(UploadDocumentViewModel model) {
    if (model.loadingState == LoadingState.loaded) {
      if (model.failure != null) {
        showSnackBar(context: context, message: model.failure.message);
      } else {
        if (model.skipUploadDocumentResponse.status == 1) {
          showSnackBar(
              context: context,
              message: model.skipUploadDocumentResponse.message);
          Future.delayed(Duration(seconds: 2), () {
            gotoActivationPage();
          });
        } else {
          showSnackBar(
              context: context,
              message: "Something went wrong");
        }
      }
    }
  }

  void gotoDocumentPage() {
    ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.documentPage);
  }

  void gotoActivationPage() {
    ExtendedNavigator.rootNavigator
        .pushReplacementNamed(Routes.activationPendingPage);
  }

  void gotoLoginPage() {
    ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
        Routes.loginPage, (Route<dynamic> route) => false);
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
}
