// To parse this JSON data, do
//
//     final getTransactionHistoryResponse = getTransactionHistoryResponseFromJson(jsonString);

import 'dart:convert';

GetTransactionHistoryResponse getTransactionHistoryResponseFromJson(String str) => GetTransactionHistoryResponse.fromJson(json.decode(str));

String getTransactionHistoryResponseToJson(GetTransactionHistoryResponse data) => json.encode(data.toJson());

class GetTransactionHistoryResponse {
  int status;
  List<History> history;

  GetTransactionHistoryResponse({
    this.status,
    this.history,
  });

  factory GetTransactionHistoryResponse.fromJson(Map<String, dynamic> json) => GetTransactionHistoryResponse(
    status: json["status"] == null ? null : json["status"],
    history: json["history"] == null ? null : List<History>.from(json["history"].map((x) => History.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "history": history == null ? null : List<dynamic>.from(history.map((x) => x.toJson())),
  };
}

class History {
  String txId;
  Value value;
  String timestamp;
  String isDelete;

  History({
    this.txId,
    this.value,
    this.timestamp,
    this.isDelete,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
    txId: json["TxId"] == null ? null : json["TxId"],
    value: json["Value"] == null ? null : Value.fromJson(json["Value"]),
    timestamp: json["Timestamp"] == null ? null : json["Timestamp"],
    isDelete: json["IsDelete"] == null ? null : json["IsDelete"],
  );

  Map<String, dynamic> toJson() => {
    "TxId": txId == null ? null : txId,
    "Value": value == null ? null : value.toJson(),
    "Timestamp": timestamp == null ? null : timestamp,
    "IsDelete": isDelete == null ? null : isDelete,
  };
}

class Value {
  String walletId;
  String walletType;
  double amount;
  double balance;
  String remarks;
  String action;
  TxData txData;

  Value({
    this.walletId,
    this.walletType,
    this.amount,
    this.balance,
    this.remarks,
    this.action,
    this.txData,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    walletId: json["wallet_id"] == null ? null : json["wallet_id"],
    walletType: json["wallet_type"] == null ? null : json["wallet_type"],
    amount: json["amount"] == null ? null : json["amount"].toDouble(),
    balance: json["balance"] == null ? null : json["balance"].toDouble(),
    remarks: json["remarks"] == null ? null : json["remarks"],
    action: json["action"] == null ? null : json["action"],
    txData: json["tx_data"] == null ? null : TxData.fromJson(json["tx_data"]),
  );

  Map<String, dynamic> toJson() => {
    "wallet_id": walletId == null ? null : walletId,
    "wallet_type": walletType == null ? null : walletType,
    "amount": amount == null ? null : amount,
    "balance": balance == null ? null : balance,
    "remarks": remarks == null ? null : remarks,
    "action": action == null ? null : action,
    "tx_data": txData == null ? null : txData.toJson(),
  };
}

class TxData {
  String txId;
  String masterId;
  String childId;
  String txType;
  String txDetails;

  TxData({
    this.txId,
    this.masterId,
    this.childId,
    this.txType,
    this.txDetails,
  });

  factory TxData.fromJson(Map<String, dynamic> json) => TxData(
    txId: json["tx_id"] == null ? null : json["tx_id"],
    masterId: json["master_id"] == null ? null : json["master_id"],
    childId: json["child_id"] == null ? null : json["child_id"],
    txType: json["tx_type"] == null ? null : json["tx_type"],
    txDetails: json["tx_details"] == null ? null : json["tx_details"],
  );

  Map<String, dynamic> toJson() => {
    "tx_id": txId == null ? null : txId,
    "master_id": masterId == null ? null : masterId,
    "child_id": childId == null ? null : childId,
    "tx_type": txType == null ? null : txType,
    "tx_details": txDetails == null ? null : txDetails,
  };
}


