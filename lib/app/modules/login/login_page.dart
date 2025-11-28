import 'package:evehicle/app/app_routes.dart';
import 'package:evehicle/app/modules/login/viewmodel/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'view/login_view.dart';

class LoginPage extends StatelessWidget {
  static const routeName = AppRoutes.login;

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: LoginView(),
    );
  }
}
