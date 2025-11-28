import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:local_repository/local_repository.dart';

class LocalRepositoryImpl implements LocalDataRepository {
  @override
  Future<DataVehicle> getData() async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/data/vehicle-list.json',
      );
      final jsonData = json.decode(jsonString);
      return DataVehicle.fromJson(jsonData);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
