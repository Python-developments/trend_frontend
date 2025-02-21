
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trend/core/controllers/controllers_mixins/image_picking_mixin.dart';
import 'package:trend/core/presentation/validators/is_not_empty_validator.dart';
import 'package:trend/core/presentation/widgets/custom_app_bar.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/presentation/widgets/main_button.dart';
import 'package:trend/core/presentation/widgets/text_fields/custom_image_picker_field.dart';
import 'package:trend/core/presentation/widgets/text_fields/long_text_field.dart';
import 'package:trend/dependencies.dart';
import 'package:trend/features/add_post/controllers/create_post_controller.dart';


class AddNewPostPage extends StatefulWidget {
  const AddNewPostPage({super.key});

  @override
  State<AddNewPostPage> createState() => _AddNewPostPageState();
}

class _AddNewPostPageState extends State<AddNewPostPage> {
  final CreatePostController controller =getIt<CreatePostController>();

  @override
  Widget build(final BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(barTitle: 'Add a new post', context: context),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              children: [
                LongTextField(
                  formController: controller,title: 'Description',
                  fieldKey: 'description',errorKey: 'description',
                  validator: IsNotEmptyValidator(),
                ),
                const SizedBox(height: 16),
                CustomSingleImagePickerField(
                  formController: controller,
                  title: 'Image', isFromGallery: true,
                  withCrop: true,
                ),
                Spacer(),
                Observer(
                    builder: (final _) => Center(
                      child: MainButton(title: 'Save and Share',
                        isLoading: controller.isLoading,
                        onPressed: controller.submitForm,
                        isDisabled: controller.selectedImage==ImagePickingState.empty(),
                      ),
                    )
                ),
                CustomSizedBox(height: 32,),
              ],
            ),
          ),
        ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
