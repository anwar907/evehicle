import 'package:local_repository/local_repository.dart';

class VehicleRepository {
  final LocalDataRepository _localDataRepository;

  VehicleRepository({required LocalDataRepository localDataRepository})
    : _localDataRepository = localDataRepository;

  Future<List<ElectrumBike>> getElectrumBike() async {
    try {
      final response = await _localDataRepository.getData();
      return response.electrumBikes;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
