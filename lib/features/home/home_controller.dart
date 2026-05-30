import 'package:flutter/material.dart';
import 'package:news_app/core/data_source/remote_data/api_config.dart';
import 'package:news_app/core/data_source/remote_data/api_services.dart';
import 'package:news_app/features/home/model/news_article_model.dart';

class HomeController extends ChangeNotifier {

  
  HomeController() {
    callHeadlines();
    callEverything();
  }

  bool headlinesLoading = true;
  bool everythingLoading = true;
  List<NewsArticleModel> newsArticles = [];
  List<NewsArticleModel> newsEverything = [];
  ApiServices apiServices = ApiServices();

  String errorMessage = "";

  callHeadlines() async {
    try {
      Map<String, dynamic> result = await apiServices.get(
        ApiConfig.topHeadlines,
        {"country": "us"},
      );

      newsArticles =
          (result['articles'] as List)
              .map((e) => NewsArticleModel.fromJson(e))
              .toList();

      headlinesLoading = false;
      errorMessage = "";
    } catch (e) {
      headlinesLoading = false;
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  callEverything() async {
    try {
      Map<String, dynamic> result = await apiServices.get(
        ApiConfig.everything,
        {"q": "us"},
      );

      newsEverything =
          (result['articles'] as List)
              .map((e) => NewsArticleModel.fromJson(e))
              .toList();

      everythingLoading = false;
      errorMessage = "";
    } catch (e) {
      everythingLoading = false;
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  void changeLoading(bool value) {
    headlinesLoading = value;
    everythingLoading = value;
    notifyListeners();
  }
}
