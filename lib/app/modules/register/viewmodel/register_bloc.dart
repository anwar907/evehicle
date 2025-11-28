import 'package:equatable/equatable.dart';
import 'package:evehicle/app/utils/extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<SecurePasswordEvent>((event, emit) => securePassword(emit));
  }

  void securePassword(Emitter<RegisterState> emit) {
    emit(state.copyWith(obsecurePassword: !state.obsecurePassword));
  }
}
