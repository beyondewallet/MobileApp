// To parse this JSON data, do
//
//     final isWalletExistResponse = isWalletExistResponseFromJson(jsonString);

import 'dart:convert';

IsWalletExistResponse isWalletExistResponseFromJson(String str) => IsWalletExistResponse.fromJson(json.decode(str));

String isWalletExistResponseToJson(IsWalletExistResponse data) => json.encode(data.toJson());

class IsWalletExistResponse {
  int status;
  String message;
  User user;

  IsWalletExistResponse({
    this.status,
    this.message,
    this.user,
  });

  factory IsWalletExistResponse.fromJson(Map<String, dynamic> json) => IsWalletExistResponse(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "user": user == null ? null : user.toJson(),
  };
}

class User {
  String bank;
  int status;
  String id;
  String name;
  String mobile;
  String email;
  String address;
  String username;
  int v;
  String country;
  String idName;
  String idNumber;
  String idType;
  String lastName;
  String state;
  DateTime validTill;

  User({
    this.bank,
    this.status,
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.address,
    this.username,
    this.v,
    this.country,
    this.idName,
    this.idNumber,
    this.idType,
    this.lastName,
    this.state,
    this.validTill,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    bank: json["bank"] == null ? null : json["bank"],
    status: json["status"] == null ? null : json["status"],
    id: json["_id"] == null ? null : json["_id"],
    name: json["name"] == null ? null : json["name"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    email: json["email"] == null ? null : json["email"],
    address: json["address"] == null ? null : json["address"],
    username: json["username"] == null ? null : json["username"],
    v: json["__v"] == null ? null : json["__v"],
    country: json["country"] == null ? null : json["country"],
    idName: json["id_name"] == null ? null : json["id_name"],
    idNumber: json["id_number"] == null ? null : json["id_number"],
    idType: json["id_type"] == null ? null : json["id_type"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    state: json["state"] == null ? null : json["state"],
    validTill: json["valid_till"] == null ? null : DateTime.parse(json["valid_till"]),
  );

  Map<String, dynamic> toJson() => {
    "bank": bank == null ? null : bank,
    "status": status == null ? null : status,
    "_id": id == null ? null : id,
    "name": name == null ? null : name,
    "mobile": mobile == null ? null : mobile,
    "email": email == null ? null : email,
    "address": address == null ? null : address,
    "username": username == null ? null : username,
    "__v": v == null ? null : v,
    "country": country == null ? null : country,
    "id_name": idName == null ? null : idName,
    "id_number": idNumber == null ? null : idNumber,
    "id_type": idType == null ? null : idType,
    "last_name": lastName == null ? null : lastName,
    "state": state == null ? null : state,
    "valid_till": validTill == null ? null : "${validTill.year.toString().padLeft(4, '0')}-${validTill.month.toString().padLeft(2, '0')}-${validTill.day.toString().padLeft(2, '0')}",
  };
}
// To parse this JSON data, do
//
//     final isWalletExistRequest = isWalletExistRequestFromJson(jsonString);

IsWalletExistRequest isWalletExistRequestFromJson(String str) => IsWalletExistRequest.fromJson(json.decode(str));

String isWalletExistRequestToJson(IsWalletExistRequest data) => json.encode(data.toJson());

class IsWalletExistRequest {
  String mobile;

  IsWalletExistRequest({
    this.mobile,
  });

  factory IsWalletExistRequest.fromJson(Map<String, dynamic> json) => IsWalletExistRequest(
    mobile: json["mobile"] == null ? null : json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "mobile": mobile == null ? null : mobile,
  };
}