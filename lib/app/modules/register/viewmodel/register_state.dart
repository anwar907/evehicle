part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.obsecurePassword = true,
    this.status = StatusState.initial,
  });

  final bool obsecurePassword;
  final StatusState status;

  RegisterState copyWith({bool? obsecurePassword, StatusState? status}) {
    return RegisterState(
      obsecurePassword: obsecurePassword ?? this.obsecurePassword,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [obsecurePassword, status];
}

final class RegisterInitial extends RegisterState {}
