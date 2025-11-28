import 'package:evehicle/app/themes/solid_colors.dart';
import 'package:flutter/material.dart';
import 'package:local_repository/local_repository.dart';

class PackageWidget extends StatelessWidget {
  const PackageWidget({super.key, required this.packages});
  final List<RentalPackage>? packages;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Rental Packages',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(height: 12),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: packages?.length ?? 0,
            itemBuilder: (context, index) {
              final package = packages?[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: context.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: context.teal300, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: context.teal100.withValues(),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          package?.plan ?? '',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: context.teal300,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: context.green300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Popular',
                            style: TextStyle(
                              color: context.white900,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildPriceCard(
                          context,
                          'Day',
                          'Rp ${(package?.pricePerDay ?? 0) ~/ 1000}K',
                        ),
                        _buildPriceCard(
                          context,
                          'Week',
                          'Rp ${(package?.pricePerWeek ?? 0) ~/ 1000}K',
                        ),
                        _buildPriceCard(
                          context,
                          'Month',
                          'Rp ${(package?.pricePerMonth ?? 0) ~/ 1000}K',
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: context.white700,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: 16,
                            color: context.teal300,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              package?.terms ?? '',
                              style: TextStyle(
                                fontSize: 12,
                                color: context.black300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildPriceCard(BuildContext context, String period, String price) {
  return Column(
    children: [
      Text(period, style: TextStyle(fontSize: 12, color: context.black400)),
      const SizedBox(height: 4),
      Text(
        price,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: context.black,
        ),
      ),
    ],
  );
}
