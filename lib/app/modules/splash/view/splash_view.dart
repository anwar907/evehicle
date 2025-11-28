import 'package:evehicle/app/app_routes.dart';
import 'package:evehicle/app/helpers/navigation.dart';
import 'package:evehicle/app/modules/login/login_page.dart';
import 'package:evehicle/app/modules/navigation/view/navigation_view.dart';
import 'package:evehicle/app/modules/splash/viewmodel/cubit/splash_cubit.dart';
import 'package:evehicle/app/modules/splash/widgets/onboarding_widget.dart';
import 'package:evehicle/app/themes/solid_colors.dart';
import 'package:evehicle/app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = AppRoutes.initialRoute;
  const SplashScreen({super.key});

  static final List<OnboardingData> _pages = [
    OnboardingData(
      title: 'Explore Electric Bikes',
      description: 'Discover our range of eco-friendly electric bikes',
      icon: Icons.electric_bike,
    ),
    OnboardingData(
      title: 'Easy Rental Process',
      description: 'Book your bike in just a few simple steps',
      icon: Icons.touch_app,
    ),
    OnboardingData(
      title: 'Ride Green, Ride Smart',
      description: 'Join us in making the world a better place',
      icon: Icons.eco,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: Scaffold(
        body: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state.status.isLoading) {
              context.showLoadingDialog();
            }
            if (state.status.isSuccess) {
              context.dismissDialog();
              if (state.isLogin == true) {
                NavigatorHelper.pushRemoveUntil(
                  context,
                  const NavigationView(),
                );
              } else {
                NavigatorHelper.pushRemoveUntil(context, LoginPage());
              }
            }

            if (state.status.isFailure) {
              context.dismissDialog();
              context.showErrorDialog('Login failed');
            }
          },
          child: SafeArea(
            child: BlocBuilder<SplashCubit, SplashState>(
              builder: (context, state) {
                final currentPage = state.currentPage;
                return Column(
                  children: [
                    Expanded(child: OnboardingWidget(pages: _pages)),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              _pages.length,
                              (index) => Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                width: currentPage == index ? 24 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: currentPage == index
                                      ? context.teal300
                                      : context.black400,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<SplashCubit>().checkLogin();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: context.teal300,
                                foregroundColor: context.white900,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                currentPage == _pages.length - 1
                                    ? 'Get Started'
                                    : 'Next',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String description;
  final IconData icon;

  OnboardingData({
    required this.title,
    required this.description,
    required this.icon,
  });
}
