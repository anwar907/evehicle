import 'package:remote_repository/remote_repository.dart';

class AuthRepository {
  final RemoteDataRepository _remoteDataRepository;
  AuthRepository({required RemoteDataRepository remoteDataRepository})
    : _remoteDataRepository = remoteDataRepository;

  Future<String> login(String email, String password) async {
    try {
      final token = await _remoteDataRepository.login(email, password);

      return token.session?.accessToken ?? '';
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<String> register(RegisterDto user) async {
    try {
      final token = await _remoteDataRepository.register(user);

      return token.user?.id ?? '';
    } catch (e) {
      throw Exception(e);
    }
  }
}
