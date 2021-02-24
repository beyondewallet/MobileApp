import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:beyondwallet/utils/colors.dart';

void showSnackBar(
    {@required BuildContext context,
    @required String message,
    IconData icon = Icons.info_outline,
    int duration = 3,
    Color indicatorColor = kPrimaryColor}) {
  Flushbar(
    message: message,
    icon: Icon(
      icon,
      size: 28.0,
      color: Colors.blue[300],
    ),
    duration: Duration(seconds: duration),
    leftBarIndicatorColor: indicatorColor,
  )..show(context);
}
