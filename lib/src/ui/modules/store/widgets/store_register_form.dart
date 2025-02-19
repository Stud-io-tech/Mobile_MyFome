// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_fome/src/domain/validators/stores/store_register_validator.dart';
import 'package:uikit/uikit.dart';

import 'package:my_fome/src/constants/icon_constant.dart';
import 'package:my_fome/src/constants/text_constant.dart';
import 'package:my_fome/src/ui/controllers/uploads/upload_controller.dart';
import 'package:validatorless/validatorless.dart';

class StoreRegisterForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameEC;
  final TextEditingController descriptionEC;
  final TextEditingController whatsappEC;

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode descriptionFocusNode = FocusNode();
  final FocusNode whatsappFocusNode = FocusNode();

  StoreRegisterForm({
    super.key,
    required this.formKey,
    required this.nameEC,
    required this.descriptionEC,
    required this.whatsappEC,
  });
  final uploadController = Injector.get<UploadController>();
  final validator = StoreRegisterValidator();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: SizeToken.sm,
        children: [
          Observer(builder: (_) {
            return InputUploadImage(
              key: const Key("imageStoreRegister"),
              image: uploadController.selectedImageFile,
              onTap: uploadController.uploadImage,
              labelText: TextConstant.image,
              hintText: TextConstant.uploadImage,
              icon: IconConstant.upload,
            );
          }),
          InputForm(
            key: const Key("nameStoreRegister"),
            hintText: TextConstant.storeName,
            controller: nameEC,
            textInputAction: TextInputAction.next,
            labelText: TextConstant.name,
            validator: Validatorless.required(
              TextConstant.fieldError,
            ),
          ),
          InputForm(
            key: const Key("descriptionStoreRegister"),
            hintText: TextConstant.storeDescription,
            maxLines: 3,
            controller: descriptionEC,
            textInputAction: TextInputAction.next,
            labelText: TextConstant.description,
            validator: Validatorless.required(
              TextConstant.fieldError,
            ),
          ),
          InputForm(
            key: const Key("whatsappStoreRegister"),
            inputFormatters: MaskToken.phoneInput,
            validator: Validatorless.multiple(
              [
                Validatorless.required(TextConstant.fieldError),
                Validatorless.min(15, TextConstant.minCaractersPhone),
                Validatorless.max(15, TextConstant.maxCaractersPhone)
              ],
            ),
            hintText: TextConstant.storeWhatsappNumber,
            controller: whatsappEC,
            textInputAction: TextInputAction.done,
            labelText: TextConstant.whatsapp,
          ),
        ],
      ),
    );
  }
}
