import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Networkimages extends StatelessWidget {
  const Networkimages({required this.imageUrl, required this.size, super.key});
  final String imageUrl;
  final double size;
  @override
  Widget build(final BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: Colors.white,
      child: CachedNetworkImage(
        imageUrl: imageUrl, // رابط الصورة
        imageBuilder: (final context, final imageProvider) => CircleAvatar(
          radius: size,
          backgroundImage: imageProvider, // الصورة المحمّلة
        ),
        placeholder: (final context, final url) => CircleAvatar(
          radius: size,
          backgroundImage:
              AssetImage('assets/images/avatar.jpg'), // صورة أثناء التحميل
        ),
        errorWidget: (final context, final url, final error) => CircleAvatar(
          radius: size,
          backgroundImage:
              AssetImage('assets/images/avatar.jpg'), // صورة في حال الخطأ
        ),
      ),
    );
  }
}
