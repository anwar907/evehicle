import 'package:local_repository/src/models/data_vehicle_model.dart';

abstract class LocalDataRepository {
  Future<DataVehicle> getData();
}
