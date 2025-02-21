import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:trend/core/presentation/router/auto_router.dart';

class LogoutTile extends StatelessWidget {
  const LogoutTile({super.key});


  @override
  Widget build(final BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 5),
      leading: SvgPicture.asset('assets/icons/shape.svg'),
      title: Text(
        'Log Out',
        style: TextStyle(
          color: Colors.red,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: () {
            getAppRouter.replaceAll(
            [ LoginRoute()]);
      }
    );
  }
}
