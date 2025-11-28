import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:evehicle/app/app_routes.dart';
import 'package:evehicle/app/modules/home/home_page.dart';
import 'package:evehicle/app/modules/location/location_page.dart';
import 'package:evehicle/app/modules/navigation/viewmodel/cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationView extends StatelessWidget {
  static const routeName = AppRoutes.home;
  const NavigationView({super.key});

  final List<Widget> screens = const [HomePage(), LocationPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonAnimator: .scaling,
      floatingActionButtonLocation: .miniEndFloat,
      body: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) {
          return screens[state];
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) {
          return AnimatedBottomNavigationBar.builder(
            itemCount: context.read<NavigationCubit>().listIcon.length,
            tabBuilder: (index, isActive) => Icon(
              context.read<NavigationCubit>().listIcon[index],
              size: 30,
              color: isActive ? Colors.black : Colors.grey,
            ),
            activeIndex: state,
            elevation: 1,
            blurEffect: true,
            safeAreaValues: const SafeAreaValues(
              bottom: false,
              left: false,
              right: false,
            ),
            notchSmoothness: .verySmoothEdge,
            gapLocation: .none,
            onTap: (index) => context.read<NavigationCubit>().changePage(index),
          );
        },
      ),
    );
  }
}
