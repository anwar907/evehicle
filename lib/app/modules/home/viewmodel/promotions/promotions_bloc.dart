import 'package:equatable/equatable.dart';
import 'package:evehicle/app/utils/extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_repository/local_repository.dart';
import 'package:promotions_repository/promotions_repository.dart';

part 'promotions_event.dart';
part 'promotions_state.dart';

class PromotionsBloc extends Bloc<PromotionsEvent, PromotionsState> {
  PromotionsBloc({required PromotionsRepository promotionsRepository})
    : _promotionsRepository = promotionsRepository,
      super(PromotionsInitial()) {
    on<FetchPromotionsEvent>(promotionsItems);
  }

  final PromotionsRepository _promotionsRepository;

  Future<void> promotionsItems(
    FetchPromotionsEvent event,
    Emitter<PromotionsState> emit,
  ) async {
    try {
      emit(state.copyWith(status: StatusState.loading));
      final promotions = await _promotionsRepository.getPromotions();
      emit(state.copyWith(status: StatusState.success, promotions: promotions));
    } catch (e) {
      emit(state.copyWith(status: StatusState.failure));
    }
  }
}
