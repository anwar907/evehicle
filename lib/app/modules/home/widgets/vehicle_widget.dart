import 'package:carousel_slider/carousel_slider.dart';
import 'package:evehicle/app/helpers/navigation.dart';
import 'package:evehicle/app/modules/home/viewmodel/vehicle/vehicle_bloc.dart';
import 'package:evehicle/app/modules/home/widgets/vehicle_details.dart';
import 'package:evehicle/app/themes/solid_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_repository/local_repository.dart';

class VehicleWidget extends StatelessWidget {
  const VehicleWidget({
    super.key,
    required this.dataVehicle,
    required this.currentIndex,
  });
  final List<ElectrumBike>? dataVehicle;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    final currentVehicle = dataVehicle?[currentIndex];
    return Column(
      children: [
        InkWell(
          onTap: () {
            NavigatorHelper.push(
              context,
              VehicleDetails(vehicle: currentVehicle!),
            );
          },
          child: CarouselSlider(
            items:
                dataVehicle
                    ?.map(
                      (e) => Container(
                        width: double.infinity,
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: .circular(12),
                          color: context.teal,
                          image: DecorationImage(
                            image: AssetImage(e.photo),
                            fit: .cover,
                          ),
                        ),
                        child: Align(
                          alignment: .topCenter,
                          child: Padding(
                            padding: const .all(16.0),
                            child: Text(
                              e.model,
                              style: TextStyle(
                                color: context.white900,
                                fontSize: 20,
                                fontWeight: .bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList() ??
                [],
            options: CarouselOptions(
              padEnds: true,
              animateToClosest: true,
              height: 400.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.9,
              onPageChanged: (index, reason) {
                context.read<VehicleBloc>().add(ChangeVehicleIndexEvent(index));
              },
              scrollDirection: .horizontal,
            ),
          ),
        ),
        if (currentVehicle != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  currentVehicle.model,
                  style: const TextStyle(fontSize: 18, fontWeight: .bold),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: context.white,
                          borderRadius: .circular(12),
                          border: .all(color: context.black500, width: 1),
                        ),
                        padding: const .all(16),
                        child: Column(
                          children: [
                            Icon(Icons.speed, color: context.teal300),
                            const SizedBox(height: 4),
                            Text(
                              currentVehicle.maxSpeed,
                              style: const TextStyle(fontWeight: .bold),
                            ),
                            const Text(
                              'Max Speed',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: context.white,
                          borderRadius: .circular(12),
                          border: .all(color: context.black500, width: 1),
                        ),
                        padding: const .all(16),
                        child: Column(
                          children: [
                            Icon(
                              Icons.battery_charging_full,
                              color: context.green300,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              currentVehicle.range,
                              style: const TextStyle(fontWeight: .bold),
                            ),
                            const Text('Range', style: TextStyle(fontSize: 10)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}
