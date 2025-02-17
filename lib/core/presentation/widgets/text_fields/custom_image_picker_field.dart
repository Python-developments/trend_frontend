import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/controllers/controllers_mixins/image_picking_mixin.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/widgets/custom_network_image.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/presentation/widgets/dashed_rect.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/core/utils/extensions.dart';
import 'package:trend/data/dtos/file_dto.dart';
import 'package:trend/dependencies.dart';
import 'package:trend/third_parties_modules/abstract/i_image_picking_module.dart';

class CustomImagePickerField extends StatefulWidget {
  final SingleImagePickingMixin formController;
  final String title;
  final String? initialValue;
  final FieldPriority imagePriority;
  final bool isFromGallery;

  const CustomImagePickerField({
    required this.title,
    required this.initialValue,
    required this.formController,
    required this.isFromGallery,
    super.key,
    this.imagePriority = FieldPriority.required,
  });

  @override
  State<CustomImagePickerField> createState() => _CustomImagePickerFieldState();
}

class _CustomImagePickerFieldState extends State<CustomImagePickerField> {
  final IImagePickingModule imagePickingModule = getIt<IImagePickingModule>();
  PickedImage? selectedImage;

  Future<void> selectImage() async {
    selectedImage =
        await imagePickingModule.pickImage(isFromGallery: widget.isFromGallery);
    widget.formController.changeSelectedImage(selectedImage != null
        ? FileDto(fileBytes: selectedImage!.$3, fileName: selectedImage!.$1)
        : null);
    setState(() {});
  }

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: selectImage,
      child: DashedRect(
        color: AppStyle.black.shade200,
        child: SizedBox(
          height: 48.h,
          child: Row(
            children: [
              const CustomSizedBox(
                width: 16,
              ),
              SizedBox(
                height: 36.r,
                width: 36.r,
                child: FittedBox(
                    child: selectedImage != null
                        ? Image.file(File(selectedImage!.$2))
                        : widget.initialValue != null
                            ? CustomNetworkImage(imagePath: widget.initialValue)
                            : const Icon(Icons.image_outlined,
                                color: AppStyle.lightPrimaryColor)),
              ),
              const CustomSizedBox(
                width: 8,
              ),
              Text(
                'Upload a photo'.translateWord,
                style: AppStyle.textTheme.bodySmall!
                    .copyWith(color: AppStyle.black.shade400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
