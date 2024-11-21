import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'upload_controller.g.dart';

class UploadController = UploadControllerBase with _$UploadController;

abstract class UploadControllerBase with Store {
  @observable
  XFile? imageFile;

  @action
  void setImage(XFile? file) {
    imageFile = file;
  }

  @action
  void removeImage() {
    imageFile = null;
  }
}
