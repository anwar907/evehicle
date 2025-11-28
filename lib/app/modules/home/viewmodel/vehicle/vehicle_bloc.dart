import 'package:equatable/equatable.dart';
import 'package:evehicle/app/utils/extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_repository/local_repository.dart';
import 'package:vehicle_repository/vehicle_repository.dart';

part 'vehicle_event.dart';
part 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  VehicleBloc({required VehicleRepository vehicleRepository})
    : _vehicleRepository = vehicleRepository,
      super(VehicleInitial()) {
    on<FetchVehiclesEvent>(fetchVehicles);
    on<ChangeVehicleIndexEvent>(changeVehicleIndex);
  }

  final VehicleRepository _vehicleRepository;

  Future<void> fetchVehicles(
    FetchVehiclesEvent event,
    Emitter<VehicleState> emit,
  ) async {
    try {
      emit(state.copyWith(status: StatusState.loading));
      final vehicles = await _vehicleRepository.getElectrumBike();

      emit(state.copyWith(dataVehicle: vehicles, status: StatusState.success));
    } catch (e) {
      emit(state.copyWith(status: StatusState.failure));
    }
  }

  void changeVehicleIndex(
    ChangeVehicleIndexEvent event,
    Emitter<VehicleState> emit,
  ) {
    emit(state.copyWith(currentIndex: event.index));
  }
}
