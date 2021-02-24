// To parse this JSON data, do
//
//     final sendMoneyToNonWalletRequest = sendMoneyToNonWalletRequestFromJson(jsonString);

import 'dart:convert';


// To parse this JSON data, do
//
//     final sendMoneyToWalletRequest = sendMoneyToWalletRequestFromJson(jsonString);

SendMoneyToWalletRequest sendMoneyToWalletRequestFromJson(String str) => SendMoneyToWalletRequest.fromJson(json.decode(str));

String sendMoneyToWalletRequestToJson(SendMoneyToWalletRequest data) => json.encode(data.toJson());

class SendMoneyToWalletRequest {
  String receiverMobile;
  String note;
  double sendingAmount;
  bool isInclusive;

  SendMoneyToWalletRequest({
    this.receiverMobile,
    this.note,
    this.sendingAmount,
    this.isInclusive
  });

  factory SendMoneyToWalletRequest.fromJson(Map<String, dynamic> json) => SendMoneyToWalletRequest(
    receiverMobile: json["receiverMobile"] == null ? null : json["receiverMobile"],
    note: json["note"] == null ? null : json["note"],
    sendingAmount: json["sending_amount"] == null ? null : json["sending_amount"],
    isInclusive: json["isInclusive"] == null ? null : json["isInclusive"],
  );

  Map<String, dynamic> toJson() => {
    "receiverMobile": receiverMobile == null ? null : receiverMobile,
    "note": note == null ? null : note,
    "sending_amount": sendingAmount == null ? null : sendingAmount,
    "isInclusive" : isInclusive == null ? null : isInclusive,
  };
}

// To parse this JSON data, do
//
//     final sendMoneyToWalletResponse = sendMoneyToWalletResponseFromJson(jsonString);

SendMoneyToWalletResponse sendMoneyToWalletResponseFromJson(String str) => SendMoneyToWalletResponse.fromJson(json.decode(str));

String sendMoneyToWalletResponseToJson(SendMoneyToWalletResponse data) => json.encode(data.toJson());

class SendMoneyToWalletResponse {
  int status;
  String error;

  SendMoneyToWalletResponse({
    this.status,
    this.error,
  });

  factory SendMoneyToWalletResponse.fromJson(Map<String, dynamic> json) => SendMoneyToWalletResponse(
    status: json["status"] == null ? null : json["status"],
    error: json["error"] == null ? null : json["error"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "error": error == null ? null : error,
  };
}




