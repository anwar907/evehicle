import 'package:evehicle/app/themes/solid_colors.dart';
import 'package:flutter/material.dart';
import 'package:local_repository/local_repository.dart';

class StickyBanner extends StatelessWidget {
  const StickyBanner({super.key, required this.promotions});

  final List<Promotion>? promotions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        padding: const .symmetric(horizontal: 16, vertical: 8),
        scrollDirection: .horizontal,
        itemCount: promotions?.length ?? 0,
        itemBuilder: (context, index) {
          final promo = promotions?[index];
          return Container(
            width: 280,
            margin: const .only(right: 12),
            padding: const .all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [context.teal300, context.teal500],
              ),
              borderRadius: .circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  promo?.title ?? '',
                  style: TextStyle(
                    color: context.white900,
                    fontSize: 16,
                    fontWeight: .bold,
                  ),
                ),
                Text(
                  promo?.shortCopy ?? '',
                  style: TextStyle(color: context.white800, fontSize: 12),
                  maxLines: 2,
                  overflow: .ellipsis,
                ),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      'Valid until: ${promo?.validity}',
                      style: TextStyle(color: context.white700, fontSize: 10),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: context.white900,
                      size: 16,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
