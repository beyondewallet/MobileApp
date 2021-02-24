import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UnknownRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(tr('Unknown Page'),),
          automaticallyImplyLeading: true,
        ),
        body: Center(child: Text(tr('Page not found'),),)
    );
  }
}