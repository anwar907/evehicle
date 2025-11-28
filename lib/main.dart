import 'package:auth_repository/auth_repository.dart';
import 'package:evehicle/app/app.dart';
import 'package:flutter/material.dart';
import 'package:local_repository/local_repository.dart';
import 'package:promotions_repository/promotions_repository.dart';
import 'package:remote_repository/remote_repository.dart';
import 'package:rental_package_repository/rental_package_repository.dart';
import 'package:vehicle_repository/vehicle_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final supabase = await SupabaseRepositoryFactory.create();
  final localRepo = LocalRepositoryImpl();

  runApp(
    MainApp(
      remoteDataRepository: supabase,
      localDataRepository: localRepo,
      authRepository: AuthRepository(remoteDataRepository: supabase),
      vehicleRepository: VehicleRepository(localDataRepository: localRepo),
      promotionsRepository: PromotionsRepository(
        localDataRepository: localRepo,
      ),
      packageRepository: RentalPackageRepository(
        localDataRepository: localRepo,
      ),
    ),
  );
}
