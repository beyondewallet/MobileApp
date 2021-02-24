import 'package:beyondwallet/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionListItem extends StatelessWidget {

  final String transactionType;
  final String transactionAmount, transactionInfo, recipient;
  final DateTime transactionDate;
  const TransactionListItem(
      {Key key,
        this.transactionType,
        this.transactionAmount,
        this.transactionInfo,
        this.transactionDate,
        this.recipient})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    String transactionName;
    Color color;
      if(transactionType=="DR") {
        transactionName = "Sent";
        color = Colors.red;
      }

    if(transactionType=="CR") {
      transactionName = "Received";
      color = Colors.green;
    }
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16, right: 8.0,left: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(

                        child: Text(recipient,
                          style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("$transactionAmount",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(" ${DateFormat.yMd().add_jm().format(transactionDate)}",
                        style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Text("$transactionName",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}