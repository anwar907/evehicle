import 'package:auth_repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:evehicle/app/helpers/shared_preference.dart';
import 'package:evehicle/app/utils/extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(LoginInitial()) {
    on<SecurePasswordEvent>((event, emit) => obsecurePassword(emit));
    on<LoginUserEvent>(loginWithEmail);
  }

  final AuthRepository _authRepository;

  Future<void> loginWithEmail(
    LoginUserEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(state.copyWith(status: StatusState.loading));
      final user = await _authRepository.login(event.email, event.password);
      if (user.isEmpty) {
        throw Exception('Login failed');
      }
      PreferenceHelper.instance.setString('token', user);

      emit(state.copyWith(status: StatusState.success));
    } catch (e) {
      emit(state.copyWith(status: StatusState.failure));
    }
  }

  void obsecurePassword(Emitter<LoginState> emit) {
    emit(state.copyWith(obsecurePassword: !state.obsecurePassword));
  }
}
