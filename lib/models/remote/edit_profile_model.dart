import 'dart:convert';


// To parse this JSON data, do
//
//     final updateEmailRequest = updateEmailRequestFromJson(jsonString);


UpdateEmailRequest updateEmailRequestFromJson(String str) => UpdateEmailRequest.fromJson(json.decode(str));

String updateEmailRequestToJson(UpdateEmailRequest data) => json.encode(data.toJson());

class UpdateEmailRequest {
  String email;

  UpdateEmailRequest({
    this.email,
  });

  factory UpdateEmailRequest.fromJson(Map<String, dynamic> json) => UpdateEmailRequest(
    email: json["email"] == null ? null : json["email"],
  );

  Map<String, dynamic> toJson() => {
    "email": email == null ? null : email,
  };
}

// To parse this JSON data, do
//
//     final updateEmailResponse = updateEmailResponseFromJson(jsonString);

UpdateEmailResponse updateEmailResponseFromJson(String str) => UpdateEmailResponse.fromJson(json.decode(str));

String updateEmailResponseToJson(UpdateEmailResponse data) => json.encode(data.toJson());

class UpdateEmailResponse {
  int status;

  UpdateEmailResponse({
    this.status,
  });

  factory UpdateEmailResponse.fromJson(Map<String, dynamic> json) => UpdateEmailResponse(
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
  };
}

// To parse this JSON data, do
//
//     final updateNameResponse = updateNameResponseFromJson(jsonString);

UpdateNameRequest updateNameRequestFromJson(String str) => UpdateNameRequest.fromJson(json.decode(str));

String updateNameRequestToJson(UpdateNameRequest data) => json.encode(data.toJson());

class UpdateNameRequest {
  String name;

  UpdateNameRequest({
    this.name,
  });

  factory UpdateNameRequest.fromJson(Map<String, dynamic> json) => UpdateNameRequest(
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
  };
}

// To parse this JSON data, do
//
//     final updateNameResponse = updateNameResponseFromJson(jsonString);

// To parse this JSON data, do
//
//     final updateNameResponse = updateNameResponseFromJson(jsonString);


UpdateNameResponse updateNameResponseFromJson(String str) => UpdateNameResponse.fromJson(json.decode(str));

String updateNameResponseToJson(UpdateNameResponse data) => json.encode(data.toJson());

class UpdateNameResponse {
  int status;
  String message;
  String error;

  UpdateNameResponse({
    this.status,
    this.message,
    this.error,
  });

  factory UpdateNameResponse.fromJson(Map<String, dynamic> json) => UpdateNameResponse(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    error: json["error"] == null ? null : json["error"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "error": error == null ? null : error,
  };
}




