import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class blockTile extends StatelessWidget {
  const blockTile({required this.id, super.key});
  final int id;
  @override
  Widget build(final BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
          color: Color(0xffF9F9FC),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 5),
        leading: Icon(Icons.block, size: 20.sp),
        title: Text('BlockList'),
        trailing: SvgPicture.asset(
          'assets/icons/chevron-small-left.svg',
          height: 20,
          width: 20,
          fit: BoxFit.cover,
        ),
        onTap: () {},
      ),
    );
  }
}
