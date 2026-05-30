import 'package:flutter/material.dart';

class OnboardingController with ChangeNotifier {
  final PageController pageController = PageController();
  int currentIndex = 0;

bool isLastPage = false;

  void onChange(int index) {

    if (index == 2) {
      isLastPage = true;
    } else {
      isLastPage = false;
    }
    currentIndex = index;
    notifyListeners();
  }

  // void changePage(int index) {
  //   currentIndex = index;
  //   notifyListeners();
  // }

  void nextPage() {
    pageController.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    notifyListeners();
  }
}
