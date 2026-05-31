import 'package:flutter/material.dart';
import 'package:news_app/core/data_source/local_data/preference_manager.dart';
import 'package:news_app/features/auth/login_screen.dart';
import 'package:news_app/features/onboarding/controller/onboarding_controller.dart';
import 'package:news_app/features/onboarding/onboarding_model.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  int currentIndex = 0;

  void navigateToLogin(BuildContext context) {
    PreferencesManager().setBool(
      'key_onboarding_screen',
      true,
    ); // save value to local storage
    Navigator.pushReplacement(
      context,
      (MaterialPageRoute(builder: (context) => LoginScreen())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingController(),
      builder: (context, child) {
        final controller = context.read<OnboardingController>();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              // if (currentIndex != 2)
              Consumer<OnboardingController>(
                builder: (context, value, child) {
                  return value.currentIndex == 2
                      ? SizedBox()
                      : TextButton(
                        onPressed: () {
                          navigateToLogin(context);
                        },
                        child: Text('Skip'),
                      );
                },
              ),
            ],
          ),
          body: PageView.builder(
            itemCount: OnBoardingModel.onBoardingList.length,
            controller: controller.pageController,
            onPageChanged: (int index) {
              context.read<OnboardingController>().onChange(index);
              //currentIndex = index;
            },

            itemBuilder: (context, index) {
              final OnBoardingModel model =
                  OnBoardingModel.onBoardingList[index];
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Image.asset(model.image),
                    const SizedBox(height: 24),
                    Text(
                      model.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      model.description,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24),

                    Consumer<OnboardingController>(
                      builder: (context, controller, child) {
                        return SmoothPageIndicator(
                          controller:
                              controller.pageController, // PageController
                          count: 3,
                          effect: SwapEffect(), // your preferred effect
                        );

                        //  Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     ...List.generate(
                        //       3,
                        //       (index) => Padding(
                        //         padding: const EdgeInsets.symmetric(
                        //           horizontal: 3,
                        //         ),
                        //         child: Container(
                        //           width: 16,
                        //           height: 16,
                        //           decoration: BoxDecoration(
                        //             color:
                        //                 controller.currentIndex == index
                        //                     ? Colors.red
                        //                     : Colors.grey,
                        //             shape: BoxShape.circle,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // );
                      },
                    ),

                    Spacer(),
                    Consumer<OnboardingController>(
                      builder: (context, value, child) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                              MediaQuery.of(context).size.width,
                              51,
                            ),
                          ),
                          onPressed: () {
                            if (!value.isLastPage) {
                              controller.pageController.nextPage(
                                duration: (Duration(milliseconds: 300)),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              navigateToLogin(context);
                            }
                          },
                          child:
                              value.isLastPage
                                  ? Text("Get Started")
                                  : Text("Next"),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
