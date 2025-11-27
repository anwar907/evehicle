import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:local_repository/local_repository.dart';
import 'package:local_repository/src/models/data_vehicle_model.dart';

class LocalRepositoryImpl implements LocalDataRepository {
  @override
  Future<DataVehicle> getData() async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/data/vehicle-list.json',
      );
      final jsonData = json.decode(jsonString);
      return DataVehicle.fromJson(jsonData);
    } catch (e) {
      throw Exception(e);
    }
  }
}
