import 'package:flutter/foundation.dart';
import 'package:remote_repository/src/models/register_dto.dart';
import 'package:remote_repository/src/remote_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseRepositoryFactory {
  final _supabase = Supabase.instance.client;
  SupabaseClient get publicClient => _supabase;

  static Future<RemoteDataRepository> create() async {
    const supabaseUrl = String.fromEnvironment('URL', defaultValue: '');
    const supabaseKey = String.fromEnvironment(
      'SUPABASE_ANON_KEY',
      defaultValue: '',
    );

    if (supabaseUrl.isEmpty || supabaseUrl.isEmpty) {
      throw Exception('Invalid Supabase URL or Key');
    }

    final supabase = await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseKey,
      debug: kDebugMode,
      authOptions: FlutterAuthClientOptions(autoRefreshToken: true),
      storageOptions: StorageClientOptions(retryAttempts: 3),
    );

    return RemoteRepositoryImpl(supabaseClient: supabase.client);
  }
}

class RemoteRepositoryImpl implements RemoteDataRepository {
  RemoteRepositoryImpl({SupabaseClient? supabaseClient})
    : _supabaseClient = supabaseClient ?? Supabase.instance.client;
  final SupabaseClient _supabaseClient;

  @override
  Future<AuthResponse> login(String email, String password) async {
    try {
      return await _supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } on AuthException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<AuthResponse> register(RegisterDto user) async {
    try {
      final response = await _supabaseClient.auth.signUp(
        email: user.email,
        password: user.password,
        data: {'name': user.name, 'email': user.email},
      );

      if (response.user == null) {
        throw Exception('Registration failed');
      }

      return response;
    } catch (e) {
      throw Exception('Registration error: $e');
    }
  }
}
