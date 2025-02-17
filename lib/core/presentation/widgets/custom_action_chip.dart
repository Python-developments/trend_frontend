import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/core/utils/extensions.dart';

class CustomActionChip extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final ChipState chipState;
  final double width;
  const CustomActionChip(
      {required this.title,
      required this.onPressed,
      required this.chipState,
      required this.width,
      super.key});

  @override
  Widget build(final BuildContext context) {
    return ActionChip(
      labelPadding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.zero,
      onPressed:(){
        if(chipState!=ChipState.disabled) {
          onPressed();
        }
      },
      color: WidgetStatePropertyAll(
          chipState==ChipState.selected ? AppStyle.blue:
                chipState==ChipState.disabled ? AppStyle.black.shade200
                    : AppStyle.white),
      shape: RoundedRectangleBorder(
          borderRadius: AppStyle.borderRadius,
          side: BorderSide(
              color: chipState==ChipState.selected
                  ? AppStyle.blue
                  : AppStyle.black.shade200
          )),
      label:Stack(

        children: [
          if( chipState==ChipState.disabled)
            Positioned.fill(
              child: CustomPaint(
                    painter: DiagonalLinePainter()),
            ),
    SizedBox(
    width: width+8.w,
    child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppStyle.textTheme.bodyMedium!.copyWith(
                  color: chipState==ChipState.selected ? AppStyle.white : AppStyle.black.shade600,
            ),
          ),
          ),

        ],
      ),
    );
  }
}
class DiagonalLinePainter extends CustomPainter {
  @override
  void paint(final Canvas canvas, final Size size) {

    final Offset start = Offset(size.width, 0),
                end = Offset(0, size.height);
    final paint = Paint()
      ..color = AppStyle.black.shade300
      ..strokeWidth = 1
    ;
    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(final DiagonalLinePainter oldDelegate) => false;
}