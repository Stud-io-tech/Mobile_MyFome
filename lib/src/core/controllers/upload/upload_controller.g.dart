// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UploadController on UploadControllerBase, Store {
  late final _$imageFileAtom =
      Atom(name: 'UploadControllerBase.imageFile', context: context);

  @override
  XFile? get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(XFile? value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  late final _$UploadControllerBaseActionController =
      ActionController(name: 'UploadControllerBase', context: context);

  @override
  void setImage(XFile? file) {
    final _$actionInfo = _$UploadControllerBaseActionController.startAction(
        name: 'UploadControllerBase.setImage');
    try {
      return super.setImage(file);
    } finally {
      _$UploadControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeImage() {
    final _$actionInfo = _$UploadControllerBaseActionController.startAction(
        name: 'UploadControllerBase.removeImage');
    try {
      return super.removeImage();
    } finally {
      _$UploadControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
imageFile: ${imageFile}
    ''';
  }
}
