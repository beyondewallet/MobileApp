// To parse this JSON data, do
//
//     final getContactListResponse = getContactListResponseFromJson(jsonString);

import 'dart:convert';

GetContactListResponse getContactListResponseFromJson(String str) => GetContactListResponse.fromJson(json.decode(str));

String getContactListResponseToJson(GetContactListResponse data) => json.encode(data.toJson());

class GetContactListResponse {
  int status;
  Contacts contacts;

  GetContactListResponse({
    this.status,
    this.contacts,
  });

  factory GetContactListResponse.fromJson(Map<String, dynamic> json) => GetContactListResponse(
    status: json["status"] == null ? null : json["status"],
    contacts: json["contacts"] == null ? null : Contacts.fromJson(json["contacts"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "contacts": contacts == null ? null : contacts.toJson(),
  };
}

class Contacts {
  List<Wallet> wallet;
  List<NonWallet> nonWallet;

  Contacts({
    this.wallet,
    this.nonWallet,
  });

  factory Contacts.fromJson(Map<String, dynamic> json) => Contacts(
    wallet: json["wallet"] == null ? null : List<Wallet>.from(json["wallet"].map((x) => Wallet.fromJson(x))),
    nonWallet: json["non_wallet"] == null ? null : List<NonWallet>.from(json["non_wallet"].map((x) => NonWallet.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "wallet": wallet == null ? null : List<dynamic>.from(wallet.map((x) => x.toJson())),
    "non_wallet": nonWallet == null ? null : List<dynamic>.from(nonWallet.map((x) => x.toJson())),
  };
}

class NonWallet {
  String id;
  String name;
  String lastName;
  String mobile;
  String email;
  String country;
  int v;

  NonWallet({
    this.id,
    this.name,
    this.lastName,
    this.mobile,
    this.email,
    this.country,
    this.v,
  });

  factory NonWallet.fromJson(Map<String, dynamic> json) => NonWallet(
    id: json["_id"] == null ? null : json["_id"],
    name: json["name"] == null ? null : json["name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    email: json["email"] == null ? null : json["email"],
    country: json["country"] == null ? null : json["country"],
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "name": name == null ? null : name,
    "last_name": lastName == null ? null : lastName,
    "mobile": mobile == null ? null : mobile,
    "email": email == null ? null : email,
    "country": country == null ? null : country,
    "__v": v == null ? null : v,
  };
}

class Wallet {
  String id;
  String name;
  String mobile;

  Wallet({
    this.id,
    this.name,
    this.mobile,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
    id: json["_id"] == null ? null : json["_id"],
    name: json["name"] == null ? null : json["name"],
    mobile: json["mobile"] == null ? null : json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "name": name == null ? null : name,
    "mobile": mobile == null ? null : mobile,
  };
}
