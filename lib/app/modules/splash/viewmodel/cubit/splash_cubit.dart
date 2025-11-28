import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState(isLogin: false));

  Future<void> checkLogin() async {
    // Simulasi loading splash screen
    await Future.delayed(const Duration(seconds: 2));

    SharedPreferences.getInstance().then((prefs) {
      final token = prefs.getString('token');
      if (token != null) {
        emit(state.copyWith(isLogin: true));
      }
    });
    emit(state.copyWith(isLogin: false));
  }
}
