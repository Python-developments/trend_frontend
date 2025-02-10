import 'package:flutter/material.dart';

import '../../../../shared/style/app_styles.dart';

class OtpInputField extends StatefulWidget {
  final Function() onCompleted;
  final TextEditingController otpController ;

  const OtpInputField({super.key, required this.onCompleted, required this.otpController});

  @override
  State<OtpInputField> createState() => _OtpInputFieldState();
}

class _OtpInputFieldState extends State<OtpInputField> {
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: widget.otpController,
      onEditingComplete: (){
        FocusScope.of(context).unfocus();
        widget.onCompleted();
      },
      onFieldSubmitted: (_) {
        FocusScope.of(context).unfocus();
        widget.onCompleted();
      },
      keyboardType: TextInputType.number,
      maxLength: 5,
      decoration: InputDecoration(
        labelText: 'OTP Code',
        labelStyle: AppStyles.styleSmall15(context),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the OTP';
        } else if (value.length != 5) {
          return 'OTP must be 6 digits';
        }
        return null;
      },
    );
  }
}