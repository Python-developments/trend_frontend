import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Commentcontent extends StatelessWidget {
  const Commentcontent({required this.content, super.key});
  final String content;
  @override
  Widget build(final BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text(
              content ?? '',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 11.sp,
                  color: Color(0xff9E9E9E)),
              softWrap: true,
            ),
          ),
        ),
      ],
    );
  }
}
