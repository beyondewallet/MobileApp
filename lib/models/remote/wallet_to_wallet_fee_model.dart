// To parse this JSON data, do
//
//     final walletToWalletFeeResponse = walletToWalletFeeResponseFromJson(jsonString);

import 'dart:convert';

WalletToWalletFeeResponse walletToWalletFeeResponseFromJson(String str) => WalletToWalletFeeResponse.fromJson(json.decode(str));

String walletToWalletFeeResponseToJson(WalletToWalletFeeResponse data) => json.encode(data.toJson());

class WalletToWalletFeeResponse {
  int status;
  double fee;

  WalletToWalletFeeResponse({
    this.status,
    this.fee,
  });

  factory WalletToWalletFeeResponse.fromJson(Map<String, dynamic> json) => WalletToWalletFeeResponse(
    status: json["status"] == null ? null : json["status"],
    fee: json["fee"] == null ? null : json["fee"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "fee": fee == null ? null : fee,
  };
}

// To parse this JSON data, do
//
//     final walletToWalletFeeRequest = walletToWalletFeeRequestFromJson(jsonString);


WalletToWalletFeeRequest walletToWalletFeeRequestFromJson(String str) => WalletToWalletFeeRequest.fromJson(json.decode(str));

String walletToWalletFeeRequestToJson(WalletToWalletFeeRequest data) => json.encode(data.toJson());

class WalletToWalletFeeRequest {
  double amount;

  WalletToWalletFeeRequest({
    this.amount,
  });

  factory WalletToWalletFeeRequest.fromJson(Map<String, dynamic> json) => WalletToWalletFeeRequest(
    amount: json["amount"] as double == null ? null : json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount == null ? null : amount,
  };
}
