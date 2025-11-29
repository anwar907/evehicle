import 'package:evehicle/app/themes/solid_colors.dart';
import 'package:flutter/material.dart';
import 'package:local_repository/local_repository.dart';

class PackageWidget extends StatelessWidget {
  const PackageWidget({super.key, required this.packages});
  final List<RentalPackage>? packages;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          const Padding(
            padding: .symmetric(horizontal: 20),
            child: Text(
              'Rental Packages',
              style: TextStyle(fontWeight: .bold, fontSize: 20),
            ),
          ),
          const SizedBox(height: 12),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const .symmetric(horizontal: 20),
            itemCount: packages?.length ?? 0,
            itemBuilder: (context, index) {
              final package = packages?[index];
              return Container(
                margin: const .only(bottom: 16),
                padding: const .all(20),
                decoration: BoxDecoration(
                  color: context.white,
                  borderRadius: .circular(16),
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
                  crossAxisAlignment: .start,
                  children: [
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          package?.plan ?? '',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: .bold,
                            color: context.teal300,
                          ),
                        ),
                        Container(
                          padding: const .symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: context.green300,
                            borderRadius: .circular(20),
                          ),
                          child: Text(
                            'Popular',
                            style: TextStyle(
                              color: context.white900,
                              fontSize: 12,
                              fontWeight: .bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: .spaceAround,
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
                      padding: const .all(12),
                      decoration: BoxDecoration(
                        color: context.white700,
                        borderRadius: .circular(8),
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
        style: TextStyle(fontSize: 16, fontWeight: .bold, color: context.black),
      ),
    ],
  );
}
