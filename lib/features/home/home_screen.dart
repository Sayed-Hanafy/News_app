import 'package:flutter/material.dart';
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
            body: Center(
              child:
                  controller.headlinesLoading 
                      ? CircularProgressIndicator()
                      : Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: controller.newsEverything.length,
                              itemBuilder: (context, index) {
                                return Text(
                                  controller.newsEverything[index].author,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
            ),
          );
        },
      ),
    );
  }
}
