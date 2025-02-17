import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/widgets/text_fields/custom_text_field.dart';
import 'package:trend/core/utils/debouncer.dart';

class SearchTextField extends StatefulWidget {
  final TextEditingController? textController;
  final void Function(String) onSearchStringChanged;
  final Color? fieldColor;
  final String? initialString;
  final FocusNode? focusNode;

  const SearchTextField(
      {required this.fieldColor,
      required this.onSearchStringChanged,
      this.textController,
      this.initialString,
      super.key,
      this.focusNode});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final Debouncer debouncer = Debouncer(duration:const Duration( milliseconds: 850));
  late TextEditingController textController;
  @override
  void initState() {
    textController = widget.textController ??
        TextEditingController(text: widget.initialString);
    textController.addListener(onChangeString);
    super.initState();
  }
  /*@override
  void didUpdateWidget(covariant SearchTextField oldWidget) {
    textController=TextEditingController(text: widget.initialString??'');
    textController.addListener(onChangeString);
    super.didUpdateWidget(oldWidget);
  }*/

  void onChangeString() {
    if (textController.text.isEmpty || textController.text.length >= 3) {
      debouncer.run(() => widget.onSearchStringChanged(textController.text));
    }
  }

  @override
  Widget build(final BuildContext context) {
    return CustomTextField(
      fieldColor: widget.fieldColor,
      focusNode: widget.focusNode,
      title: null,
      height: 32.h,
      hint: 'Search',
      textController: textController,
      validator: null,
      prefixIcon: Icon(
        Icons.search,
        size: 20.r,
        color: AppStyle.black.shade400,
      ),
      suffixIcon: IconButton(
        icon: Icon(
          Icons.close,
          size: 20.r,
          color: AppStyle.black.shade400,
        ),
        onPressed: textController.clear,
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    widget.focusNode?.dispose();
    super.dispose();
  }
}
