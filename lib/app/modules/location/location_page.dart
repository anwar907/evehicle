import 'package:evehicle/app/app_routes.dart';
import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  static const routeName = AppRoutes.location;
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Location Page')),
      body: const Center(child: Text('Location Page')),
    );
  }
}
