import 'package:auth_repository/auth_repository.dart';
import 'package:evehicle/app/app_routes.dart';
import 'package:evehicle/app/modules/register/view/register_view.dart';
import 'package:evehicle/app/modules/register/viewmodel/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = AppRoutes.register;
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RegisterBloc(authRepository: context.read<AuthRepository>()),
      child: RegisterView(),
    );
  }
}
