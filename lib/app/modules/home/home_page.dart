import 'package:evehicle/app/app_routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = AppRoutes.home;
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Home View')),
    );
  }
}
