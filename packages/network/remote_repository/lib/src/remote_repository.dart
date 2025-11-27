import 'package:supabase_flutter/supabase_flutter.dart';

import 'models/register_dto.dart';

abstract class RemoteDataRepository {
  Future<AuthResponse> login(String email, String password);
  Future<AuthResponse> register(RegisterDto user);
}
