import 'package:equatable/equatable.dart';
import 'package:evehicle/app/helpers/shared_preference.dart';
import 'package:evehicle/app/utils/extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState(isLogin: false, currentPage: 0));

  Future<void> checkLogin() async {
    // Simulasi loading splash screen
    try {
      emit(state.copyWith(status: StatusState.loading));
      await Future.delayed(const Duration(seconds: 3));
      final token = await PreferenceHelper.instance.getString('token');

      if (token != null) {
        emit(state.copyWith(isLogin: true, status: StatusState.success));
      } else {
        emit(state.copyWith(isLogin: false, status: StatusState.success));
      }
    } catch (e) {
      emit(state.copyWith(status: StatusState.failure));
    }
  }

  void changePage(int page) {
    emit(state.copyWith(currentPage: page));
  }
}
