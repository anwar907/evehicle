import 'package:evehicle/app/app_routes.dart';
import 'package:evehicle/app/modules/login/viewmodel/login_bloc.dart';
import 'package:evehicle/app/themes/solid_colors.dart';
import 'package:evehicle/app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isFormValid = ValueNotifier<bool>(false);
  void _validateForm() {
    final isValid = formKey.currentState?.validate() ?? false;
    isFormValid.value = isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: .symmetric(horizontal: 12.0),
          child: Form(
            key: formKey,
            onChanged: _validateForm,
            autovalidateMode: .onUserInteraction,
            child: Column(
              spacing: 12.0,
              mainAxisAlignment: .center,
              crossAxisAlignment: .start,
              children: [
                // Spacer(),
                Expanded(child: Center(child: Text('L O G I N'))),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: 'Email'),
                  onChanged: (value) => _validateForm(),
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      onChanged: (value) => _validateForm(),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () => context.read<LoginBloc>().add(
                            SecurePasswordEvent(),
                          ),
                          icon: Icon(
                            state.obsecurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      obscureText: state.obsecurePassword,
                    );
                  },
                ),
                BlocListener<LoginBloc, LoginState>(
                  listenWhen: (previous, current) =>
                      previous.status != current.status,
                  listener: (context, state) {
                    if (state.status.isLoading) {
                      context.showSnackBar('Loading...');
                    }

                    if (state.status.isSuccess) {
                      context.showSnackBar('Login Success');
                      Navigator.pushNamed(context, AppRoutes.home);
                    }

                    if (state.status.isFailure) {
                      context.showSnackBar('Login Failed');
                    }
                  },
                  child: ValueListenableBuilder(
                    valueListenable: isFormValid,
                    builder: (context, isValid, _) {
                      return Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isValid
                                ? context.white
                                : Colors.grey,
                          ),
                          onPressed: () {
                            if (!isValid) return;
                            Navigator.pushNamed(context, AppRoutes.home);
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: context.black),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Center(
                  heightFactor: 5,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.register);
                    },
                    child: Text(
                      'Register Here',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
