import 'package:beyondwallet/models/remote/login_model.dart';
import 'package:beyondwallet/models/remote/skip_upload_document._model.dart';
import 'package:beyondwallet/models/remote/upload_document_model.dart';
import 'package:beyondwallet/models/remote/user_details_model.dart';
import 'package:beyondwallet/services/api_services.dart';
import 'package:rxdart/rxdart.dart';

class UploadDocumentRepository {
  final Api _api;

  UploadDocumentRepository({Api api}) : _api = api;

  Future<UploadDocumentResponse> uploadDocumentRequest(UploadDocumentRequest uploadDocument) async{
    UploadDocumentResponse response = await _api.uploadDocumentNew(uploadDocument);
    return response;
  }
  Future<SkipUploadDocumentResponse> skipUploadDocumentRequest() async{
    SkipUploadDocumentResponse response = await _api.skipUploadDocument();
    return response;
  }
}