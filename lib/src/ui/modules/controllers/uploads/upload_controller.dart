import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'upload_controller.g.dart';

class UploadController = UploadControllerBase with _$UploadController;

abstract class UploadControllerBase with Store {
  @observable
  XFile? imageFile;

  File? get selectedImageFile =>
      imageFile != null ? File(imageFile!.path) : null;
      
  @action
  uploadImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = pickedFile;
    }
  }

  @action
  removeImage() {
    imageFile = null;
  }
}
