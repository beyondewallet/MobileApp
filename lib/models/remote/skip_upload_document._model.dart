// To parse this JSON data, do
//
//     final skipUploadDocumentResponse = skipUploadDocumentResponseFromJson(jsonString);

import 'dart:convert';

SkipUploadDocumentResponse skipUploadDocumentResponseFromJson(String str) => SkipUploadDocumentResponse.fromJson(json.decode(str));

String skipUploadDocumentResponseToJson(SkipUploadDocumentResponse data) => json.encode(data.toJson());

class SkipUploadDocumentResponse {
  int status;
  String message;
  String error;

  SkipUploadDocumentResponse({
    this.status,
    this.message,
    this.error,
  });

  factory SkipUploadDocumentResponse.fromJson(Map<String, dynamic> json) => SkipUploadDocumentResponse(
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
