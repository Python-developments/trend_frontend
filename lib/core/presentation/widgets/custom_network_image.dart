import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/assets.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? imagePath, heroTag;
  final double? width, height;
  final void Function()? onPressImage;
  final BoxFit? boxFit;
  final BorderRadius radius;
  final BoxShape shape;
  final bool initialLoadFromCache;
  const CustomNetworkImage({
    required this.imagePath,
    super.key,
    this.shape = BoxShape.rectangle,
    this.onPressImage,
    this.boxFit,
    this.radius = AppStyle.borderRadius,
    this.heroTag,
    this.height,
    this.width,
    this.initialLoadFromCache = false,
  });


  @override
  Widget build(final BuildContext context) {
    final Widget child = GestureDetector(
      onTap: onPressImage,
      child: ClipRRect(
        borderRadius: radius,
        child: ClipOval(
          clipBehavior: shape == BoxShape.circle
              ? Clip.antiAliasWithSaveLayer
              : Clip.none,
          child: CachedNetworkImage(
            fit: boxFit,
            imageUrl: imagePath ?? '',
            height: height,
            width: width,
            errorWidget: (final _, final __, final ___) => Image.asset(
              Assets.emptyView,
              height: height,
              width: width,
              fit: BoxFit.fill,
            ),
            placeholder: (
              final _,
              final __,
            ) =>
                initialLoadFromCache
                    ? Image(
                        image: CachedNetworkImageProvider(imagePath ?? ''),
                        height: height,
                        width: width,
                        fit: boxFit,
                      )
                    : Container(
                        height: height,
                        width: width,
                        color: AppStyle.black.shade200,
                      ),
          ),
        ),
      ),
    );
    return heroTag != null
        ? Hero(
            tag: heroTag!,
            child: child,
          )
        : child;
  }
}
