import 'package:flutter/widgets.dart';

class Notificatioverb extends StatelessWidget {
  const Notificatioverb({required this.verb, super.key});
  final String verb;
  @override
  Widget build(final BuildContext context) {
    return Text(
      verb, // Dynamic verb text
      style: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff999EB2)),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
