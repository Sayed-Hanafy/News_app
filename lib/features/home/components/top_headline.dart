import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/extensions/date_extension.dart';
import 'package:news_app/core/widgets/custom_cached_image.dart';
import 'package:news_app/features/home/home_controller.dart';
import 'package:provider/provider.dart';

class TopHeadline extends StatelessWidget {
  const TopHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (BuildContext context, controller, Widget? child) {
        return SliverList.builder(
          itemCount: controller.newsTopHeadLine.length,
          itemBuilder: (BuildContext context, int index) {
            final model = controller.newsTopHeadLine[index];
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  model.urlToImage != null && model.urlToImage!.isNotEmpty
                      ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CustomCachedImage(
                          imagePath: model.urlToImage ?? '',
                          height: 80,
                          width: 120,
                        ),
                      )
                      : Container(
                        alignment: Alignment.center,
                        child: SizedBox(height: 80, width: 120),
                      ),
                  SizedBox(width: 8),

                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          model.title ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),

                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                (model.author ?? 'Unknown').substring(min(model.author!.length, 8)),
                                style: TextStyle(fontSize: 12),

                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                            //SizedBox(width: 4),
                            Text(
                              model.publishedAt.formatTime(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.bookmark_border),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
