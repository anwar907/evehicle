import 'package:evehicle/app/modules/splash/view/splash_view.dart';
import 'package:evehicle/app/modules/splash/viewmodel/cubit/splash_cubit.dart';
import 'package:evehicle/app/themes/solid_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({super.key, required this.pages});

  final List<OnboardingData> pages;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    return PageView.builder(
      controller: pageController,
      onPageChanged: (index) {
        context.read<SplashCubit>().changePage(index);
      },
      itemCount: pages.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const .all(40),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Container(
                padding: const .all(32),
                decoration: BoxDecoration(
                  color: context.teal700,
                  shape: .circle,
                ),
                child: Icon(
                  pages[index].icon,
                  size: 100,
                  color: context.teal300,
                ),
              ),
              const SizedBox(height: 48),
              Text(
                pages[index].title,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: .bold,
                  color: context.black,
                ),
                textAlign: .center,
              ),
              const SizedBox(height: 16),
              Text(
                pages[index].description,
                style: TextStyle(fontSize: 16, color: context.black400),
                textAlign: .center,
              ),
            ],
          ),
        );
      },
    );
  }
}
