import 'dart:convert';

// To parse this JSON data, do
//
//     final getBalanceResponse = getBalanceResponseFromJson(jsonString);

import 'dart:convert';

GetBalanceResponse getBalanceResponseFromJson(String str) => GetBalanceResponse.fromJson(json.decode(str));

String getBalanceResponseToJson(GetBalanceResponse data) => json.encode(data.toJson());

class GetBalanceResponse {
  int status;
  double balance;

  GetBalanceResponse({
    this.status,
    this.balance,
  });

  factory GetBalanceResponse.fromJson(Map<String, dynamic> json) => GetBalanceResponse(
    status: json["status"] == null ? null : json["status"],
    balance: json["balance"]  == null ? 0.0 : json["balance"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "balance": balance == null ? null : balance,
  };
}

