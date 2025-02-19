import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/controllers/controllers_mixins/image_picking_mixin.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/assets.dart';
import 'package:trend/core/presentation/widgets/custom_network_image.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/dtos/file_dto.dart';
import 'package:trend/dependencies.dart';
import 'package:trend/third_parties_modules/abstract/i_image_picking_module.dart';

class CustomSingleImagePickerField extends StatelessWidget {
  final SingleImagePickingMixin formController;
  final String title;
  final FieldPriority imagePriority;
  final bool isFromGallery, withCrop;

  const CustomSingleImagePickerField({
    required this.title,
    required this.formController,
    required this.isFromGallery,
    required this.withCrop,
    super.key,
    this.imagePriority = FieldPriority.required,
  });
  @override
  Widget build(final BuildContext context) {
    return CustomImagePickerField(
      onSelectImage: formController.changeSelectedImage,
      title: title,
      withCrop: withCrop,
      initialImage: formController.selectedImage,
      imagePriority: imagePriority,
      isFromGallery: isFromGallery,
    );
  }
}
/*
class CustomMultiImagePickerField extends StatelessWidget {
  final MultipleImagePickingMixin formController;
  final int imageIndex;
  final String title;
  final FieldPriority imagePriority;
  final bool isFromGallery, withCrop ;
  final bool withBorder;
  final bool isCircleShape;

  const CustomMultiImagePickerField({
    required this.title,
    required this.imageIndex,
    required this.formController,
    required this.isFromGallery,
    required this.withCrop,
    required this.isCircleShape,
    super.key,
    this.imagePriority = FieldPriority.required,
    this.withBorder =true
  });
  @override
  Widget build(final BuildContext context) {
    return DecoratedBox(
      decoration: imageIndex == 0 && withBorder
          ? BoxDecoration(border: Border.all(color: AppStyle.starsColor, width: 2), borderRadius: AppStyle.borderRadius)
          : const BoxDecoration(),
      child: isCircleShape?
      CustomImagePicker(
        onSelectImage: (final value) => formController.changeImage(index: imageIndex, newImage: value),
        withCrop: withCrop,
        title: title,
        initialImage: formController.images[imageIndex],
        imagePriority: imagePriority,
        isFromGallery: isFromGallery,
        removeImage: formController.images.length>1?
            (){
          formController.removeImage(imageIndex: imageIndex);
        }:null,
      ):
      CustomImagePickerField(
        onSelectImage: (final value) => formController.changeImage(index: imageIndex, newImage: value),
        withCrop: withCrop,
        title: title,
        initialImage: formController.images[imageIndex],
        imagePriority: imagePriority,
        isFromGallery: isFromGallery,
        trailing: GestureDetector(
          onTap: () => formController.removeImage(imageIndex: imageIndex),
          child: Container(
            padding: EdgeInsets.all(8.r),
            child: Container(
              height: 24.r,
              width: 24.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: imageIndex > 0 ? AppStyle.errorColor : AppStyle.starsColor,
              ),
              child: Icon(
                imageIndex > 0 ? Icons.close : Icons.star,
                color: AppStyle.white,
                size: 16.r,
              ),
            ),
          ),
        ),
      ),
    );
  }
}*/

/*
class CustomIncreaseImagesPickerField extends StatelessWidget {
  final MultipleImagePickingMixin formController;
  final bool withCrop;
  const CustomIncreaseImagesPickerField({
    required this.formController,
    required this.withCrop,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return DecoratedBox(
      decoration:  BoxDecoration(border: Border.all(
          color: AppStyle.starsColor, width: 2), borderRadius: AppStyle.borderRadius),
      child: GestureDetector(
        onTap: () async {
          final IImagePickingModule imagePickingModule = getIt<IImagePickingModule>();

          final FileDto? newImage = await imagePickingModule.pickImage(
              isFromGallery: true, withCrop: withCrop);

          if (newImage == null) {
            return;
          }
          else{
            formController.addImage(newImage);
          }
        },
        child: Icon(Icons.add,size: 24.r,),
      ),
    );
  }
}
*/

class CustomImagePickerField extends StatefulWidget {
  final void Function(FileDto) onSelectImage;
  final String title;
  final ImagePickingState initialImage;
  final FieldPriority imagePriority;
  final bool isFromGallery, withCrop;
  final Widget? trailing;

  const CustomImagePickerField({
    required this.title,
    required this.onSelectImage,
    required this.isFromGallery,
    required this.initialImage,
    required this.withCrop,
    super.key,
    this.trailing,
    this.imagePriority = FieldPriority.required,
  });

  @override
  State<CustomImagePickerField> createState() => _CustomImagePickerFieldState();
}

class _CustomImagePickerFieldState extends State<CustomImagePickerField> {
  final IImagePickingModule imagePickingModule = getIt<IImagePickingModule>();
  late ImagePickingState selectedImage = widget.initialImage;

  Future<void> selectImage() async {
    final FileDto? newImage = await imagePickingModule.pickImage(isFromGallery: widget.isFromGallery, withCrop: widget.withCrop);

    if (newImage == null) {
      return;
    }
    selectedImage = ImagePickingState(fileDto: newImage, imageModel: null);
    widget.onSelectImage(newImage);
    setState(() {});
  }

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: selectImage,
      child:  SizedBox(
          height: 48.h,
          child: Row(
            children: [
              const CustomSizedBox(
                width: 16,
              ),
              SizedBox(
                  height: 36.r,
                  width: 36.r,
                  child: ClipRRect(
                    borderRadius: AppStyle.borderRadius,
                    child: FittedBox(
                      child: selectedImage.fileDto != null
                          ? Image.file(File(selectedImage.fileDto!.filePath))
                          : selectedImage.imageModel != null
                          ? CustomNetworkImage(imagePath:  selectedImage.imageModel!.url)
                          : const Icon(Icons.image_outlined, color: AppStyle.blue),
                    ),
                  )),
              const CustomSizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  'Upload a photo',
                  style: AppStyle.textTheme.bodySmall!.copyWith(color: AppStyle.black.shade400),
                ),
              ),
              if (widget.trailing != null) widget.trailing!,
              const CustomSizedBox(
                width: 16,
              ),
            ],
          ),
        ),
    );
  }
}


class CustomImagePicker extends StatefulWidget {
  final void Function(FileDto) onSelectImage;
  final VoidCallback? removeImage;
  final String title;
  final ImagePickingState initialImage;
  final FieldPriority imagePriority;
  final bool isFromGallery, withCrop;
  final Widget? trailing;

  const CustomImagePicker({required this.title, required this.onSelectImage,
    required this.isFromGallery, required this.withCrop, required this.initialImage,
    required this.removeImage,
    super.key,
    this.trailing,
    this.imagePriority = FieldPriority.required,
  });

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  final IImagePickingModule imagePickingModule = getIt<IImagePickingModule>();
  late ImagePickingState selectedImage = widget.initialImage;

  Future<void> selectImage() async {
    final FileDto? newImage = await imagePickingModule.pickImage(isFromGallery: widget.isFromGallery, withCrop: widget.withCrop);

    if (newImage == null) {
      return;
    }
    selectedImage = ImagePickingState(fileDto: newImage, imageModel: null);
    widget.onSelectImage(newImage);
    setState(() {});
  }

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
        onTap: selectImage,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 136.r,
              width: 136.r,
              decoration: BoxDecoration(shape: BoxShape.circle, color: AppStyle.blue),
              child: FittedBox(
                fit: BoxFit.fill,
                child: ClipOval(
                  child: selectedImage.fileDto != null
                      ? Image.file(
                    File(
                      selectedImage.fileDto!.filePath,
                    ),
                    fit: BoxFit.fitWidth,
                  )
                      : selectedImage.imageModel != null
                      ? CustomNetworkImage(
                    imagePath: selectedImage.imageModel!.url,
                    boxFit: BoxFit.fitWidth,
                  )
                      : Image.asset(
                    Assets.appLogo,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 8.r,
                right: 8.r,
                child: InkWell(
                  onTap: () {
                    // Add your onTap functionality here
                  },
                  borderRadius: BorderRadius.circular(20), // Adjust based on padding for ripple effect
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppStyle.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.photo_camera,
                        color: Colors.white,
                        size: 16.r,
                      ),
                    ),
                  ),
                )),
            if(widget.removeImage!=null)
              Positioned(
                  top: 8.r,
                  left: 8.r,
                  child: InkWell(
                    onTap: (){
                      widget.removeImage!();
                    },
                    borderRadius: BorderRadius.circular(20), // Adjust based on padding for ripple effect
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppStyle.errorColor,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 16.r,
                        ),
                      ),
                    ),
                  )),
          ],
        ));
  }
}
