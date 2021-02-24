// To parse this JSON data, do
//
//     final walletToNonWalletFeeRequest = walletToNonWalletFeeRequestFromJson(jsonString);

import 'dart:convert';

WalletToNonWalletFeeRequest walletToNonWalletFeeRequestFromJson(String str) => WalletToNonWalletFeeRequest.fromJson(json.decode(str));

String walletToNonWalletFeeRequestToJson(WalletToNonWalletFeeRequest data) => json.encode(data.toJson());

class WalletToNonWalletFeeRequest {
  double amount;

  WalletToNonWalletFeeRequest({
    this.amount,
  });

  factory WalletToNonWalletFeeRequest.fromJson(Map<String, dynamic> json) => WalletToNonWalletFeeRequest(
    amount: json["amount"] as double == null ? null : json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount == null ? null : amount,
  };
}
// To parse this JSON data, do
//
//     final walletToNonWalletFeeResponse = walletToNonWalletFeeResponseFromJson(jsonString);


WalletToNonWalletFeeResponse walletToNonWalletFeeResponseFromJson(String str) => WalletToNonWalletFeeResponse.fromJson(json.decode(str));

String walletToNonWalletFeeResponseToJson(WalletToNonWalletFeeResponse data) => json.encode(data.toJson());

class WalletToNonWalletFeeResponse {
  int status;
  double fee;

  WalletToNonWalletFeeResponse({
    this.status,
    this.fee,
  });

  factory WalletToNonWalletFeeResponse.fromJson(Map<String, dynamic> json) => WalletToNonWalletFeeResponse(
    status: json["status"] == null ? null : json["status"],
    fee: json["fee"]  == null ? null : json["fee"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "fee": fee == null ? null : fee,
  };
}

