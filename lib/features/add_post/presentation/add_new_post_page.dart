
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trend/core/controllers/controllers_mixins/image_picking_mixin.dart';
import 'package:trend/core/presentation/validators/is_not_empty_validator.dart';
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
          bottomNavigationBar: Observer(
            builder: (final _) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child:MainButton(title: 'Save and Share',
                    isLoading: controller.isLoading,
                    onPressed: controller.submitForm,
                    isDisabled: controller.selectedImage==ImagePickingState.empty(),
                )
              )
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    title: const Text(
                      'Add a new post',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: LongTextField(
                    formController: controller,title: 'Description',
                    fieldKey: 'description',errorKey: 'description',
                    validator: IsNotEmptyValidator(),
                  ),
                ),
                SliverToBoxAdapter(child: const SizedBox(height: 16)),
                SliverToBoxAdapter(
                  child:CustomSingleImagePickerField(
                    formController: controller,
                    title: 'Image', isFromGallery: true,
                    withCrop: true,
                  )
                ),
                SliverToBoxAdapter(child: const SizedBox(height: 20)),
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
