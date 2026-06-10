import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/them/light_color.dart';
import 'package:shimmer/shimmer.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({super.key, required this.imagePath, this.height, this.width});

  final String imagePath;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      height: height ?? 80,
      width: width ?? 120,
      fit: BoxFit.cover,
      placeholder:
          (context, url) => SizedBox(
  width: 200.0,
  height: 100.0,
  child: Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey,
    child: Container(
      color: Colors.grey,
    ),
  ),
),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
