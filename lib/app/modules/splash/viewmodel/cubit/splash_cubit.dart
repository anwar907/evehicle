import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState(isLogin: false));

  Future<void> checkLogin() async {
    // Simulasi loading splash screen
    await Future.delayed(const Duration(seconds: 2));

    // Simulasi pengecekan login (ganti dengan logic sesungguhnya)
    // bool isLoggedIn = false; // Ganti dengan pengecekan token/session

    emit(state.copyWith(isLogin: true));
  }
}
