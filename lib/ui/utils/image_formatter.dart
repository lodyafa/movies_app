import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/api/api_config.dart';

class ImageFormatter {
  static const _unknownMediaImagePath = "assets/images/unknown_media_image.webp";

  static String _formatImageUrl({required String path, int size = 500}) {
    return "${ApiConfig.imageUrl}/w$size$path";
  }

  static Widget formatImageWidget(
    BuildContext context, {
    required String? imagePath,
    required double height,
    required double width,
  }) {
    final Widget assetImage = SizedBox(
      height: height,
      width: width,
      child: Image.asset(_unknownMediaImagePath, fit: BoxFit.cover,),
    );

    if (imagePath == null) return assetImage;

    return CachedNetworkImage(
      imageUrl: _formatImageUrl(path: imagePath),
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      placeholder: (context, url) {
        return SizedBox(
          height: height,
          width: width,
        );
      },
      errorListener: (value) {
        print("Image Exception: $value");
      },
      errorWidget: (context, url, error) {
        return assetImage;
      },
    );
  }
}
