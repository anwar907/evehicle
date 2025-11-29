import 'package:evehicle/app/helpers/navigation.dart';
import 'package:evehicle/app/modules/login/login_page.dart';
import 'package:evehicle/app/modules/register/viewmodel/register_bloc.dart';
import 'package:evehicle/app/themes/solid_colors.dart';
import 'package:evehicle/app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_repository/remote_repository.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final isFormValid = ValueNotifier<bool>(false);

  void _validateForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    isFormValid.value = isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const .all(12.0),
        child: Form(
          key: _formKey,
          autovalidateMode: .onUserInteraction,
          onChanged: _validateForm,
          child: Column(
            spacing: 12.0,
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            mainAxisSize: .max,
            children: [
              Expanded(
                flex: 1,
                child: Center(child: const Text('R E G I S T E R')),
              ),
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: 'Name'),
                onChanged: (value) => _validateForm(),
              ),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Email';
                  }
                  return null;
                },
                onChanged: (value) => _validateForm(),
                decoration: InputDecoration(hintText: 'Email'),
              ),
              BlocBuilder<RegisterBloc, RegisterState>(
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
                        onPressed: () => context.read<RegisterBloc>().add(
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

              BlocListener<RegisterBloc, RegisterState>(
                listenWhen: (previous, current) =>
                    previous.status != current.status,
                listener: (context, state) {
                  if (state.status.isLoading) {
                    context.showLoadingDialog();
                  }
                  if (state.status.isSuccess) {
                    NavigatorHelper.pushRemoveUntil(context, LoginPage());
                  }
                  if (state.status.isFailure) {
                    context.dismissDialog();
                    context.showErrorDialog('Register Failed');
                  }
                },
                child: Center(
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
                            context.read<RegisterBloc>().add(
                              RegisterWithEmailEvent(
                                user: RegisterDto(
                                  email: _emailController.text,
                                  name: _nameController.text,
                                  password: _passwordController.text,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(color: context.black),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
