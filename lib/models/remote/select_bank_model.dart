// To parse this JSON data, do
//
//     final bankListResponse = bankListResponseFromJson(jsonString);

import 'dart:convert';

BankListResponse bankListResponseFromJson(String str) => BankListResponse.fromJson(json.decode(str));

String bankListResponseToJson(BankListResponse data) => json.encode(data.toJson());

class BankListResponse {
  int status;
  List<Bank> banks;

  BankListResponse({
    this.status,
    this.banks,
  });

  factory BankListResponse.fromJson(Map<String, dynamic> json) => BankListResponse(
    status: json["status"] == null ? null : json["status"],
    banks: json["banks"] == null ? null : List<Bank>.from(json["banks"].map((x) => Bank.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "banks": banks == null ? null : List<dynamic>.from(banks.map((x) => x.toJson())),
  };
}

class Bank {
  dynamic modifiedAt;
  bool initialSetup;
  int status;
  String token;
  int totalTrans;
  String workingFrom;
  String workingTo;
  String id;
  DateTime createdAt;
  String name;
  String bcode;
  String address1;
  String state;
  String country;
  String zip;
  String ccode;
  String mobile;
  String username;
  String email;
  String userId;
  String logo;
  String contract;
  String password;
  int v;

  Bank({
    this.modifiedAt,
    this.initialSetup,
    this.status,
    this.token,
    this.totalTrans,
    this.workingFrom,
    this.workingTo,
    this.id,
    this.createdAt,
    this.name,
    this.bcode,
    this.address1,
    this.state,
    this.country,
    this.zip,
    this.ccode,
    this.mobile,
    this.username,
    this.email,
    this.userId,
    this.logo,
    this.contract,
    this.password,
    this.v,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
    modifiedAt: json["modified_at"],
    initialSetup: json["initial_setup"] == null ? null : json["initial_setup"],
    status: json["status"] == null ? null : json["status"],
    token: json["token"] == null ? null : json["token"],
    totalTrans: json["total_trans"] == null ? null : json["total_trans"],
    workingFrom: json["working_from"] == null ? null : json["working_from"],
    workingTo: json["working_to"] == null ? null : json["working_to"],
    id: json["_id"] == null ? null : json["_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    name: json["name"] == null ? null : json["name"],
    bcode: json["bcode"] == null ? null : json["bcode"],
    address1: json["address1"] == null ? null : json["address1"],
    state: json["state"] == null ? null : json["state"],
    country: json["country"] == null ? null : json["country"],
    zip: json["zip"] == null ? null : json["zip"],
    ccode: json["ccode"] == null ? null : json["ccode"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    username: json["username"] == null ? null : json["username"],
    email: json["email"] == null ? null : json["email"],
    userId: json["user_id"] == null ? null : json["user_id"],
    logo: json["logo"] == null ? null : json["logo"],
    contract: json["contract"] == null ? null : json["contract"],
    password: json["password"] == null ? null : json["password"],
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "modified_at": modifiedAt,
    "initial_setup": initialSetup == null ? null : initialSetup,
    "status": status == null ? null : status,
    "token": token == null ? null : token,
    "total_trans": totalTrans == null ? null : totalTrans,
    "working_from": workingFrom == null ? null : workingFrom,
    "working_to": workingTo == null ? null : workingTo,
    "_id": id == null ? null : id,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "name": name == null ? null : name,
    "bcode": bcode == null ? null : bcode,
    "address1": address1 == null ? null : address1,
    "state": state == null ? null : state,
    "country": country == null ? null : country,
    "zip": zip == null ? null : zip,
    "ccode": ccode == null ? null : ccode,
    "mobile": mobile == null ? null : mobile,
    "username": username == null ? null : username,
    "email": email == null ? null : email,
    "user_id": userId == null ? null : userId,
    "logo": logo == null ? null : logo,
    "contract": contract == null ? null : contract,
    "password": password == null ? null : password,
    "__v": v == null ? null : v,
  };
}

// To parse this JSON data, do
//
//     final assignBankResponse = assignBankResponseFromJson(jsonString);


// To parse this JSON data, do
//
//     final assignBankRequest = assignBankRequestFromJson(jsonString);

AssignBankRequest assignBankRequestFromJson(String str) => AssignBankRequest.fromJson(json.decode(str));

String assignBankRequestToJson(AssignBankRequest data) => json.encode(data.toJson());

class AssignBankRequest {
  String bank;

  AssignBankRequest({
    this.bank,
  });

  factory AssignBankRequest.fromJson(Map<String, dynamic> json) => AssignBankRequest(
    bank: json["bank"] == null ? null : json["bank"],
  );

  Map<String, dynamic> toJson() => {
    "bank": bank == null ? null : bank,
  };
}

// To parse this JSON data, do
//
//     final assignBankResponse = assignBankResponseFromJson(jsonString);

AssignBankResponse assignBankResponseFromJson(String str) => AssignBankResponse.fromJson(json.decode(str));

String assignBankResponseToJson(AssignBankResponse data) => json.encode(data.toJson());

class AssignBankResponse {
  int status;
  String message;

  AssignBankResponse({
    this.status,
    this.message,
  });

  factory AssignBankResponse.fromJson(Map<String, dynamic> json) => AssignBankResponse(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
  };
}






