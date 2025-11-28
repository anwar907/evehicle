import 'package:local_repository/local_repository.dart';

class PromotionsRepository {
  final LocalDataRepository _localDataRepository;

  PromotionsRepository({required LocalDataRepository localDataRepository})
    : _localDataRepository = localDataRepository;

  Future<List<Promotion>> getPromotions() async {
    try {
      final response = await _localDataRepository.getData();

      return response.promotions;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
