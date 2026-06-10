import 'package:flutter/material.dart';
import 'package:news_app/core/data_source/remote_data/api_config.dart';
import 'package:news_app/core/data_source/remote_data/api_services.dart';
import 'package:news_app/core/enums/request_status_enum.dart';
import 'package:news_app/features/home/model/news_article_model.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    callHeadlines(selectedCategory);
    callEverything();
  }

  RequestStatusEnum everythingStatus = RequestStatusEnum.loading;
  RequestStatusEnum headlinesStatus = RequestStatusEnum.loading;

  List categories = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology",
  ];
  List<NewsArticleModel> newsTopHeadLine = [];
  List<NewsArticleModel> newsEverything = [];
  ApiServices apiServices = ApiServices();

  String errorMessage = "";

  String? selectedCategory;

  callHeadlines(String? category) async {
    try {
      Map<String, dynamic> result = await apiServices.get(ApiConfig.topHeadlines, {
        "country": "us",
        "category": "$category",
      });

      newsTopHeadLine = (result['articles'] as List).map((e) => NewsArticleModel.fromJson(e)).toList();

      headlinesStatus = RequestStatusEnum.success;
      errorMessage = "";
    } catch (e) {
      headlinesStatus = RequestStatusEnum.error;
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  callEverything() async {
    try {
      Map<String, dynamic> result = await apiServices.get(ApiConfig.everything, {"q": "us"});

      newsEverything =
          (result['articles'] as List).map((e) => NewsArticleModel.fromJson(e)).toList();

      everythingStatus = RequestStatusEnum.success;
      errorMessage = "";
    } catch (e) {
      everythingStatus = RequestStatusEnum.error;
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  updateSelectedCategory(String? category) {
    selectedCategory = category;
    callHeadlines(selectedCategory);
    notifyListeners();
  }
}
