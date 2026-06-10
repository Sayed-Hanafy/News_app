import 'package:flutter/material.dart';
import 'package:news_app/core/them/light_color.dart';
import 'package:news_app/features/home/components/view_all_component.dart';
import 'package:news_app/features/home/home_controller.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer<HomeController>(
        builder: (BuildContext context, controller, Widget? child) {
          return Column(
            children: [
              ViewAllComponent(title: "Categories", textColor: Colors.black, onTap: () {}),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: 30,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      bool isSelected = controller.selectedCategory == controller.categories[index];
                      return IntrinsicWidth(
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.updateSelectedCategory(controller.categories[index]);
                              },
                              child: Text(
                                controller.categories[index][0].toUpperCase() +
                                    controller.categories[index].substring(1),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: isSelected ? LightColor.primary : LightColor.text,
                                ),
                              ),
                            ),
                            if (isSelected) ...[
                              SizedBox(height: 4),
                              Container(height: 2, color: LightColor.primary),
                            ],
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 12);
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
