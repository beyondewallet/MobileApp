import 'package:beyondwallet/utils/colors.dart';
import 'package:beyondwallet/views/components/appbar.dart';
import 'package:beyondwallet/views/tabs/send_money_non_wallet.dart';
import 'package:beyondwallet/views/tabs/send_money_wallet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendMoneyPage extends StatefulWidget {
  final String selectedContact;

  SendMoneyPage({this.selectedContact});

  @override
  _SendMoneyState createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoneyPage>
    with SingleTickerProviderStateMixin {
  int segmentedControlValue = 0;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    print("slected contect ::::::${widget.selectedContact}");
    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        tr('Send Money'),
      ),
      body: new Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: new Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: kWhite,
                  border: Border.all(color: kPrimaryColor)),
              child: TabBar(
                controller: _controller,
                labelColor: kWhite,
                indicator: SolidIndicator(),
                unselectedLabelColor: kPrimaryColor,
                tabs: [
                  Tab(
                    text: tr('To Wallet'),
                  ),
                  Tab(
                    text: tr('To Non-Wallet'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: new TabBarView(
              controller: _controller,
              children: <Widget>[
                SendMoneyWalletTab(
                  recentContactNumber: widget.selectedContact,
                ),
                SendMoneyNonWalletTab()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SolidIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback onChanged]) {
    return _SolidIndicatorPainter(this, onChanged);
  }
}

class _SolidIndicatorPainter extends BoxPainter {
  final SolidIndicator decoration;

  _SolidIndicatorPainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);

    final Rect rect = offset & configuration.size;
    final Paint paint = Paint();
    paint.color = kPrimaryColor;
    paint.style = PaintingStyle.fill;
    canvas.drawRect(rect, paint);
  }
}
