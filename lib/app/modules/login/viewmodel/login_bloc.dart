import 'package:equatable/equatable.dart';
import 'package:evehicle/app/utils/extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<SecurePasswordEvent>((event, emit) => obsecurePassword(emit));
  }

  void obsecurePassword(Emitter<LoginState> emit) {
    emit(state.copyWith(obsecurePassword: !state.obsecurePassword));
  }
}
