import 'dart:io';

import 'package:beyondwallet/helpers/error_handling.dart';
import 'package:beyondwallet/models/remote/skip_upload_document._model.dart';
import 'package:beyondwallet/models/remote/upload_document_model.dart';
import 'package:beyondwallet/repositories/upload_document_repository.dart';
import 'package:beyondwallet/viewModels/base_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadDocumentViewModel extends BaseViewModel {
  UploadDocumentRepository _uploadDocumentRepository;
  UploadDocumentResponse _uploadDocumentResponse;
  SkipUploadDocumentResponse _skipUploadDocumentResponse;

  UploadDocumentRequest _uploadDocument;
  List<UploadDocumentRequest> uploadDocumentList = List();

  UploadDocumentViewModel(
      {@required UploadDocumentRepository uploadDocumentRepository})
      : _uploadDocumentRepository = uploadDocumentRepository;

  String _panFrontImagePath;
  File _panFrontImageFile;

  String _panHandHeldImagePath;
  File _panHandHeldImageFile;

  String _idendtityDocFrontImagePath;
  File _idendtityDocFrontImageFile;

  String _idendtityDocBackImagePath;
  File _idendtityDocBackImageFile;

  String get panFrontImagePath => _panFrontImagePath;
  File get panFrontImageFile => _panFrontImageFile;

  String get panHandHeldImagePath => _panHandHeldImagePath;
  File get panHandHeldImageFile => _panHandHeldImageFile;

  String get identityDocFrontImagePath => _idendtityDocFrontImagePath;
  File get identityDocFrontImageFile => _idendtityDocFrontImageFile;

  String get identityDocBackImagePath => _idendtityDocBackImagePath;
  File get identityDocBackImageFile => _idendtityDocBackImageFile;

  void _setPanFrontImage(File image) {
    _panFrontImagePath = image.path;
    _panFrontImageFile = image;
    notifyListeners();
  }

  void _setPanHandheldImage(File image) {
    _panHandHeldImagePath = image.path;
    _panHandHeldImageFile = image;
    notifyListeners();
  }

  void _setIdentityDocFrontImage(File image) {
    _idendtityDocFrontImagePath = image.path;
    _idendtityDocFrontImageFile = image;
    notifyListeners();
  }

  void _setIdentityDocBackImage(File image) {
    _idendtityDocBackImagePath = image.path;
    _idendtityDocBackImageFile = image;
    notifyListeners();
  }

  UploadDocumentResponse get uploadDocumentResponse => _uploadDocumentResponse;

  void _setUpdateDocument(UploadDocumentResponse uploadDocumentResponse) {
    _uploadDocumentResponse = uploadDocumentResponse;
  }

  SkipUploadDocumentResponse get skipUploadDocumentResponse =>
      _skipUploadDocumentResponse;

  void _setSkipUploadDocument(
      SkipUploadDocumentResponse skipUploadDocumentResponse) {
    _skipUploadDocumentResponse = skipUploadDocumentResponse;
  }

  Future<bool> getImage(ImageSource source, int index) async {
    File image = await ImagePicker.pickImage(
        source: source, imageQuality: 70, maxWidth: 600, maxHeight: 600);
    if (image != null) {
      switch (index) {
        case 0:
          _setPanFrontImage(image);
          uploadDocumentList.add(UploadDocumentRequest(image));
          break;
        case 1:
          _setPanHandheldImage(image);
          uploadDocumentList.add(UploadDocumentRequest(image));
          break;
        case 2:
          _setIdentityDocFrontImage(image);
          uploadDocumentList.add(UploadDocumentRequest(image));
          break;
        case 3:
          _setIdentityDocBackImage(image);
          uploadDocumentList.add(UploadDocumentRequest(image));
          break;
      }
      return true;
    }
    return false;
  }

  Future uploadDocument(UploadDocumentRequest uploadDocument) async {
    _setUpdateDocument(null);
    setFailure(null);
    setLoadingState(LoadingState.loading);
    try {
      final success =
          await _uploadDocumentRepository.uploadDocumentRequest(uploadDocument);
      _setUpdateDocument(success);
    } on Failure catch (f) {
      setFailure(f);
    }
    setLoadingState(LoadingState.loaded);
  }

  Future skipUploadDocument() async {
    _setUpdateDocument(null);
    setFailure(null);
    setLoadingState(LoadingState.loading);
    try {
      final success =
          await _uploadDocumentRepository.skipUploadDocumentRequest();
      _setSkipUploadDocument(success);
    } on Failure catch (f) {
      setFailure(f);
    }
    setLoadingState(LoadingState.loaded);
  }
}
