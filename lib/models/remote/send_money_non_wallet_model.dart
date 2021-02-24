import 'dart:convert';

SendMoneyToNonWalletRequest sendMoneyToNonWalletRequestFromJson(String str) => SendMoneyToNonWalletRequest.fromJson(json.decode(str));

String sendMoneyToNonWalletRequestToJson(SendMoneyToNonWalletRequest data) => json.encode(data.toJson());

class SendMoneyToNonWalletRequest {
  String note;
  String withoutId;
  String requireOtp;
  String receiverMobile;
  String receiverGivenName;
  String receiverFamilyName;
  String receiverCountry;
  String receiverEmail;
  String receiverIdentificationType;
  String receiverIdentificationNumber;
  String receiverIdentificationValidTill;
  double sendingAmount;
  bool isInclusive;

  SendMoneyToNonWalletRequest({
    this.note,
    this.withoutId,
    this.requireOtp,
    this.receiverMobile,
    this.receiverGivenName,
    this.receiverFamilyName,
    this.receiverCountry,
    this.receiverEmail,
    this.receiverIdentificationType,
    this.receiverIdentificationNumber,
    this.receiverIdentificationValidTill,
    this.sendingAmount,
    this.isInclusive,
  });

  factory SendMoneyToNonWalletRequest.fromJson(Map<String, dynamic> json) => SendMoneyToNonWalletRequest(
    note: json["note"] == null ? null : json["note"],
    withoutId: json["withoutID"] == null ? null : json["withoutID"],
    requireOtp: json["requireOTP"] == null ? null : json["requireOTP"],
    receiverMobile: json["receiverMobile"] == null ? null : json["receiverMobile"],
    receiverGivenName: json["receiverGivenName"] == null ? null : json["receiverGivenName"],
    receiverFamilyName: json["receiverFamilyName"] == null ? null : json["receiverFamilyName"],
    receiverCountry: json["receiverCountry"] == null ? null : json["receiverCountry"],
    receiverEmail: json["receiverEmail"] == null ? null : json["receiverEmail"],
    receiverIdentificationType: json["receiverIdentificationType"] == null ? null : json["receiverIdentificationType"],
    receiverIdentificationNumber: json["receiverIdentificationNumber"] == null ? null : json["receiverIdentificationNumber"],
    receiverIdentificationValidTill: json["receiverIdentificationValidTill"] == null ? null : json["receiverIdentificationValidTill"],
    sendingAmount: json["sending_amount"] == null ? null : json["sending_amount"],
    isInclusive: json["isInclusive"] == null ? null : json["isInclusive"],
  );

  Map<String, dynamic> toJson() => {
    "note": note == null ? null : note,
    "withoutID": withoutId == null ? null : withoutId,
    "requireOTP": requireOtp == null ? null : requireOtp,
    "receiverMobile": receiverMobile == null ? null : receiverMobile,
    "receiverGivenName": receiverGivenName == null ? null : receiverGivenName,
    "receiverFamilyName": receiverFamilyName == null ? null : receiverFamilyName,
    "receiverCountry": receiverCountry == null ? null : receiverCountry,
    "receiverEmail": receiverEmail == null ? null : receiverEmail,
    "receiverIdentificationType": receiverIdentificationType == null ? null : receiverIdentificationType,
    "receiverIdentificationNumber": receiverIdentificationNumber == null ? null : receiverIdentificationNumber,
    "receiverIdentificationValidTill": receiverIdentificationValidTill == null ? null : receiverIdentificationValidTill,
    "sending_amount": sendingAmount == null ? null : sendingAmount,
    "isInclusive" : isInclusive == null ? null : isInclusive,
  };
}

// To parse this JSON data, do
//
//     final sendMoneyToNonWalletResponse = sendMoneyToNonWalletResponseFromJson(jsonString);

SendMoneyToNonWalletResponse sendMoneyToNonWalletResponseFromJson(String str) => SendMoneyToNonWalletResponse.fromJson(json.decode(str));

String sendMoneyToNonWalletResponseToJson(SendMoneyToNonWalletResponse data) => json.encode(data.toJson());

class SendMoneyToNonWalletResponse {
  int status;
  String error;

  SendMoneyToNonWalletResponse({
    this.status,
    this.error,
  });

  factory SendMoneyToNonWalletResponse.fromJson(Map<String, dynamic> json) => SendMoneyToNonWalletResponse(
    status: json["status"] == null ? null : json["status"],
    error: json["error"] == null ? null : json["error"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "error": error == null ? null : error,
  };
}
