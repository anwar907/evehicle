part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.obsecurePassword = true,
    this.status = StatusState.initial,
  });

  final bool obsecurePassword;
  final StatusState status;

  LoginState copyWith({bool? obsecurePassword, StatusState? status}) {
    return LoginState(
      obsecurePassword: obsecurePassword ?? this.obsecurePassword,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status, obsecurePassword];
}

final class LoginInitial extends LoginState {}
