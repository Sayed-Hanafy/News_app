import 'package:flutter/material.dart';
import 'package:news_app/core/enums/request_status_enum.dart';
import 'package:news_app/core/extensions/date_extension.dart';
import 'package:news_app/core/them/light_color.dart';
import 'package:news_app/core/widgets/custom_cached_image.dart';
import 'package:news_app/features/home/components/view_all_component.dart';
import 'package:news_app/features/home/home_controller.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TrendingNews extends StatelessWidget {
  const TrendingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 300,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 240,
              child: Image.asset("assets/images/homeBackground.png", fit: BoxFit.fill),
            ),
            Positioned.fill(
              top: 40,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "NEWST",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: LightColor.primary,
                    ),
                  ),
                  SizedBox(height: 8),
                  ViewAllComponent(title: "Trending News", onTap: () {}),

                  SizedBox(height: 12),

                  SizedBox(
                    height: 140,
                    //width: 240,
                    child: Consumer<HomeController>(
                      builder: (BuildContext context, HomeController controller, Widget? child) {
                        switch (controller.everythingStatus) {
                          case RequestStatusEnum.loading:
                            return Center(
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey,
                                child: Container(color: Colors.grey,height: 40,),
                              ),
                            );

                          case RequestStatusEnum.error:
                            return Center(child: Text(controller.errorMessage));
                          case RequestStatusEnum.success:
                            return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final model = controller.newsEverything[index];
                                return Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey, width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Stack(
                                      children: [
                                        if (model.urlToImage != null)
                                          CustomCachedImage(
                                            imagePath: model.urlToImage ?? '',
                                            height: 140,
                                            width: 240,
                                          ),

                                        Positioned(
                                          bottom: 12,
                                          left: 12,
                                          right: 12,
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(left: 12, right: 8),
                                                color: Colors.black54,
                                                width: 220,
                                                child: Text(
                                                  model.title!,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: LightColor.background,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Text(
                                                    model.author ?? '',
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      background: Paint()..color = Colors.black54,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                      color: LightColor.background,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Expanded(
                                                    child: Text(
                                                      model.publishedAt.formatTime(),
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,

                                                      style: TextStyle(
                                                        background: Paint()..color = Colors.black54,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w400,
                                                        color: LightColor.background,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (_, __) => const SizedBox(width: 12),
                              itemCount: controller.newsEverything.length,
                            );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
