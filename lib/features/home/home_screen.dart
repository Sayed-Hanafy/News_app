
import 'package:flutter/material.dart';
import 'package:news_app/features/home/components/category_list.dart';
import 'package:news_app/features/home/components/top_headline.dart';
import 'package:news_app/features/home/components/trending_news.dart';
import 'package:news_app/features/home/home_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeController(),
      child: Consumer<HomeController>(
        builder: (context, controller, child) {
          return Scaffold(
            body: CustomScrollView(slivers: [TrendingNews(), CategoryList(), TopHeadline()]),
          );
        },
      ),
    );
  }
}
