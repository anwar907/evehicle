import 'package:evehicle/app/helpers/navigation.dart';
import 'package:evehicle/app/helpers/shared_preference.dart';
import 'package:evehicle/app/modules/home/viewmodel/package/package_bloc.dart';
import 'package:evehicle/app/modules/home/viewmodel/promotions/promotions_bloc.dart';
import 'package:evehicle/app/modules/home/viewmodel/vehicle/vehicle_bloc.dart';
import 'package:evehicle/app/modules/home/widgets/vehicle_widget.dart';
import 'package:evehicle/app/modules/login/login_page.dart';
import 'package:evehicle/app/themes/solid_colors.dart';
import 'package:evehicle/app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/package_widget.dart';
import '../widgets/sticky_banner.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.white900,
      appBar: AppBar(
        title: ListTile(
          contentPadding: .zero,
          title: const Text('Hello'),
          subtitle: Text('Dustin Styles'),
          leading: Padding(
            padding: const .all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/img/moto1.png'),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              PreferenceHelper.instance.remove('token');
              PreferenceHelper.instance.remove('rental_interest');
              NavigatorHelper.pushRemoveUntil(context, LoginPage());
            },
            icon: Icon(Icons.exit_to_app_sharp),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<PromotionsBloc, PromotionsState>(
              builder: (context, state) {
                if (state.status.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.status.isSuccess) {
                  return StickyBanner(promotions: state.promotions);
                }
                return const SizedBox.shrink();
              },
            ),

            BlocBuilder<PackageBloc, PackageState>(
              builder: (context, state) {
                if (state.status.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.status.isSuccess) {
                  return PackageWidget(packages: state.packages);
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),

            BlocBuilder<VehicleBloc, VehicleState>(
              builder: (context, state) {
                if (state.status.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.status.isSuccess) {
                  return VehicleWidget(
                    currentIndex: state.currentIndex,
                    dataVehicle: state.dataVehicle,
                  );
                }
                if (state.status.isFailure) {
                  return const Center(child: Text('Error'));
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
