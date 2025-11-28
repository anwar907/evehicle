import 'package:evehicle/app/app_routes.dart';
import 'package:evehicle/app/modules/home/view/home_view.dart';
import 'package:evehicle/app/modules/home/viewmodel/package/package_bloc.dart';
import 'package:evehicle/app/modules/home/viewmodel/promotions/promotions_bloc.dart';
import 'package:evehicle/app/modules/home/viewmodel/vehicle/vehicle_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promotions_repository/promotions_repository.dart';
import 'package:rental_package_repository/rental_package_repository.dart';
import 'package:vehicle_repository/vehicle_repository.dart';

class HomePage extends StatelessWidget {
  static const routeName = AppRoutes.home;
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              VehicleBloc(vehicleRepository: context.read<VehicleRepository>())
                ..add(FetchVehiclesEvent()),
        ),
        BlocProvider(
          create: (context) => PromotionsBloc(
            promotionsRepository: context.read<PromotionsRepository>(),
          )..add(FetchPromotionsEvent()),
        ),
        BlocProvider(
          create: (context) => PackageBloc(
            packageRepository: context.read<RentalPackageRepository>(),
          )..add(FetchPackagesEvent()),
        ),
      ],
      child: HomeView(),
    );
  }
}
