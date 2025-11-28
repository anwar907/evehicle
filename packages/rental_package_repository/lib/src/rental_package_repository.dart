import 'package:local_repository/local_repository.dart';

class RentalPackageRepository {
  final LocalDataRepository _localDataRepository;

  RentalPackageRepository({required LocalDataRepository localDataRepository})
    : _localDataRepository = localDataRepository;

  Future<List<RentalPackage>> getRentalPackages() async {
    try {
      final response = await _localDataRepository.getData();
      return response.rentalPackages;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
