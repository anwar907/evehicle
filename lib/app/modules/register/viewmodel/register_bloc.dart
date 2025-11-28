import 'package:auth_repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:evehicle/app/utils/extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_repository/remote_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(RegisterInitial()) {
    on<SecurePasswordEvent>((event, emit) => securePassword(emit));
    on<RegisterWithEmailEvent>(loginWithEmail);
  }

  final AuthRepository _authRepository;

  Future<void> loginWithEmail(
    RegisterWithEmailEvent event,
    Emitter<RegisterState> emit,
  ) async {
    try {
      emit(state.copyWith(status: StatusState.loading));
      await _authRepository.register(
        RegisterDto(
          email: event.user.email,
          password: event.user.password,
          name: event.user.name,
        ),
      );

      emit(state.copyWith(status: StatusState.success));
    } catch (e) {
      emit(state.copyWith(status: StatusState.failure));
    }
  }

  void securePassword(Emitter<RegisterState> emit) {
    emit(state.copyWith(obsecurePassword: !state.obsecurePassword));
  }
}
