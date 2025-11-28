import 'dart:developer';

import 'package:auth_repository/auth_repository.dart';
import 'package:evehicle/app/app_routes.dart';
import 'package:evehicle/app/helpers/navigation.dart';
import 'package:evehicle/app/modules/navigation/view/navigation_view.dart';
import 'package:evehicle/app/modules/navigation/viewmodel/cubit/navigation_cubit.dart';
import 'package:evehicle/app/utils/error_handling.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_repository/local_repository.dart';
import 'package:promotions_repository/promotions_repository.dart';
import 'package:remote_repository/remote_repository.dart';
import 'package:rental_package_repository/rental_package_repository.dart';
import 'package:vehicle_repository/vehicle_repository.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(); // GlobalKey untuk Navigator

class MainApp extends StatelessWidget {
  const MainApp({
    required RemoteDataRepository remoteDataRepository,
    required LocalDataRepository localDataRepository,
    required AuthRepository authRepository,
    required PromotionsRepository promotionsRepository,
    required VehicleRepository vehicleRepository,
    required RentalPackageRepository packageRepository,
    super.key,
  }) : _remoteDataRepository = remoteDataRepository,
       _authRepository = authRepository,
       _vehicleRepository = vehicleRepository,
       _packageRepository = packageRepository,
       _promotionsRepository = promotionsRepository,
       _localDataRepository = localDataRepository;

  final RemoteDataRepository _remoteDataRepository;
  final LocalDataRepository _localDataRepository;
  final AuthRepository _authRepository;
  final VehicleRepository _vehicleRepository;
  final PromotionsRepository _promotionsRepository;
  final RentalPackageRepository _packageRepository;

  @override
  Widget build(BuildContext context) {
    FlutterError.onError = (details) {
      log('FlutterError >>>>>>>>>>>> ${details.stack}');
      FlutterError.presentError(details);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const ErrorPage()),
          (Route<dynamic> route) => false,
        );
      });
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      log('PlatformDispatcher >>>>>>>>>>>> $error');
      log('PlatformDispatcher >>>>>>>>>>>> $stack');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const ErrorPage()),
          (Route<dynamic> route) => false,
        );
      });
      return true;
    };
    ErrorWidget.builder = (FlutterErrorDetails details) {
      log('ErrorWidget >>>>>>>>>>>> ${details.stack}');

      WidgetsBinding.instance.addPostFrameCallback((_) {
        navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const ErrorPage()),
          (Route<dynamic> route) => false,
        );
      });
      return const SizedBox.shrink();
    };

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<RemoteDataRepository>(
          create: (_) => _remoteDataRepository,
        ),
        RepositoryProvider<LocalDataRepository>(
          create: (_) => _localDataRepository,
        ),
        RepositoryProvider<AuthRepository>(create: (_) => _authRepository),
        RepositoryProvider<VehicleRepository>(
          create: (_) => _vehicleRepository,
        ),
        RepositoryProvider<PromotionsRepository>(
          create: (_) => _promotionsRepository,
        ),
        RepositoryProvider<RentalPackageRepository>(
          create: (_) => _packageRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NavigationCubit>(create: (_) => NavigationCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'eVehicle',
          navigatorKey: navigatorKey,
          theme: ThemeData(primarySwatch: Colors.blue),
          initialRoute: AppRoutes.initialRoute,
          routes: AppRoutes.getRoutes(),
          builder: (context, child) {
            if (child != null) {
              return BlocListener<NavigationCubit, int>(
                listener: (context, state) {
                  if (state is NavigationState) {
                    NavigatorHelper.pushReplacementNamed(
                      context,
                      NavigationView.routeName,
                    );
                  }
                },
                child: child,
                listenWhen: (previous, current) => previous != current,
              );
            } else {
              throw StateError('Widget is null');
            }
          },
        ),
      ),
    );
  }
}
