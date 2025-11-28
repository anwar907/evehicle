part of 'splash_cubit.dart';

class SplashState extends Equatable {
  final bool? isLogin;
  final int currentPage;
  final StatusState status;
  const SplashState({
    this.isLogin,
    this.currentPage = 0,
    this.status = StatusState.initial,
  });

  SplashState copyWith({bool? isLogin, int? currentPage, StatusState? status}) {
    return SplashState(
      isLogin: isLogin ?? this.isLogin,
      status: status ?? this.status,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [isLogin, currentPage, status];
}
