import 'package:evehicle/app/themes/solid_colors.dart';
import 'package:evehicle/app/utils/form.dart';
import 'package:flutter/material.dart';
import 'package:local_repository/local_repository.dart';

class VehicleDetails extends StatelessWidget {
  const VehicleDetails({super.key, required this.vehicle});

  final ElectrumBike vehicle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.white900,
      appBar: AppBar(
        title: Text(vehicle.model),
        backgroundColor: context.teal300,
        foregroundColor: context.white900,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(vehicle.photo),
                  fit: .cover,
                ),
              ),
            ),
            Padding(
              padding: const .all(20),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        vehicle.model,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: .bold,
                          color: context.black,
                        ),
                      ),
                      Container(
                        padding: const .symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: vehicle.availability
                              ? context.green300
                              : context.black400,
                          borderRadius: .circular(20),
                        ),
                        child: Text(
                          vehicle.availability ? 'Available' : 'Not Available',
                          style: TextStyle(
                            color: context.white900,
                            fontSize: 12,
                            fontWeight: .bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Specifications',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: .bold,
                      color: context.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildSpecCard(
                          context,
                          Icons.speed,
                          'Max Speed',
                          vehicle.maxSpeed,
                          context.teal300,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildSpecCard(
                          context,
                          Icons.battery_charging_full,
                          'Range',
                          vehicle.range,
                          context.green300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildSpecCard(
                          context,
                          Icons.battery_std,
                          'Battery',
                          vehicle.batteryCapacity,
                          context.teal300,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildSpecCard(
                          context,
                          Icons.access_time,
                          'Charging',
                          vehicle.chargingTime,
                          context.green300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildSpecCard(
                    context,
                    Icons.monitor_weight,
                    'Weight',
                    vehicle.weight,
                    context.teal300,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Features',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: .bold,
                      color: context.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: vehicle.features
                        .map(
                          (feature) => Container(
                            padding: const .symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: context.teal700,
                              borderRadius: .circular(20),
                              border: .all(color: context.teal300, width: 1),
                            ),
                            child: Text(
                              feature,
                              style: TextStyle(
                                color: context.teal300,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: vehicle.availability
                          ? () => showRentForm(context)
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.teal300,
                        foregroundColor: context.white900,
                        padding: const .symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: .circular(12),
                        ),
                      ),
                      child: const Text(
                        "I'm Interested to Rent",
                        style: TextStyle(fontSize: 16, fontWeight: .bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecCard(
    BuildContext context,
    IconData icon,
    String label,
    String value,
    Color iconColor,
  ) {
    return Container(
      padding: const .all(16),
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(12),
        border: .all(color: context.black500, width: 1),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 32),
          const SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 12, color: context.black400)),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: .bold),
            textAlign: .center,
          ),
        ],
      ),
    );
  }
}
