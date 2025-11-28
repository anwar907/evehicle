import 'package:evehicle/app/app_routes.dart';
import 'package:evehicle/app/helpers/navigation.dart';
import 'package:evehicle/app/modules/login/login_page.dart';
import 'package:evehicle/app/modules/navigation/view/navigation_view.dart';
import 'package:evehicle/app/modules/splash/viewmodel/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = AppRoutes.initialRoute;
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<SplashCubit, SplashState>(
          bloc: SplashCubit()..checkLogin(),
          listener: (context, state) {
            if (state.isLogin == false) {
              NavigatorHelper.pushRemoveUntil(context, LoginPage());
            } else {
              NavigatorHelper.pushRemoveUntil(context, const NavigationView());
            }
          },
          child: const SafeArea(
            child: Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
