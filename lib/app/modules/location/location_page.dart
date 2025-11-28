import 'package:evehicle/app/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LocationPage extends StatelessWidget {
  static const routeName = AppRoutes.location;
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Location Page')),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(-6.2088, 106.8456), 
          initialZoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.evehicle',
          ),
        ],
      ),
    );
  }
}
