import 'package:evehicle/app/app.dart';
import 'package:flutter/material.dart';
import 'package:local_repository/local_repository.dart';
import 'package:remote_repository/remote_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final supabase = await SupabaseRepositoryFactory.create();
  final localRepo = LocalRepositoryImpl();

  runApp(
    MainApp(remoteDataRepository: supabase, localDataRepository: localRepo),
  );
}
