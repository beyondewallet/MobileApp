import 'package:beyondwallet/utils/themes.dart';
import 'package:beyondwallet/views/components/appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:beyondwallet/views/components/appbar.dart';

class TermsConditionPage extends StatefulWidget {
  @override
  _TermsConditionPageState createState() => _TermsConditionPageState();
}

class _TermsConditionPageState extends State<TermsConditionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(tr("Terms and Condition",),showBalance: false,automaticallyImplyLeadingValue: true),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac consequat nunc. Mauris id rutrum turpis, non bibendum libero. Vivamus metus tellus, egestas sit amet urna eu, suscipit sagittis nulla. Morbi semper vehicula diam sit amet consectetur. Fusce nec libero urna. Aliquam dapibus ornare tristique. Nunc rutrum urna vel magna congue mollis. Suspendisse risus dui, euismod quis viverra sed, euismod sed dui. Proin ut tempus tortor, eleifend bibendum sem. Donec cursus quam libero, a tempor orci tristique vitae. Proin tincidunt felis imperdiet massa semper molestie. Fusce hendrerit felis elit, ullamcorper consequat nunc tincidunt sit amet. In hac habitasse platea dictumst. Suspendisse odio magna, posuere ut urna vitae, ornare gravida urna. In dignissim sem sed augue lacinia, non bibendum orci consequat."
                    " , suscipit sagittis nulla. Morbi semper vehicula diam sit amet consectetur. Fusce nec libero urna. Aliquam dapibus ornare tristique. Nunc rutrum urna vel magna congue mollis. Suspendisse risus dui, euismod quis viverra sed, euismod sed dui. Proin ut tempus tortor, eleifend bibendum sem. Donec cursus quam libero, a tempor orci tristique vitae. Proin tincidunt felis imperdie",
                style: appTheme.textTheme.body1.copyWith(fontSize: 20),),
              ),
            )
          ),
        ),
    );
  }


}
