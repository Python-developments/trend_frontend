import 'package:flutter/material.dart';

import '../../../../shared/const/colors.dart';
import '../../../../shared/style/app_styles.dart';



class BackToLogin extends StatelessWidget {
  const BackToLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Back to Login',
            style: AppStyles.styleNormal16(context)
                .copyWith(color: Color(AppColors.blue))),
      ),
    );
  }
}
