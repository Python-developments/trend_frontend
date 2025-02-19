import 'package:flutter/material.dart';

class CommentsheetHeader extends StatelessWidget {
  const CommentsheetHeader({required this.commentcount, super.key});
  final String commentcount;
  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Spacer(),
            Container(
              height: 3,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xffE7ECF0)),
            ),
            Spacer(),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Comments '),
            Text(commentcount == '0' ? '' : commentcount)
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          color: Color(0xffE7ECF0),
          thickness: 0.2,
          height: 1,
        ),
      ],
    );
  }
}
