part of 'vehicle_bloc.dart';

class VehicleState extends Equatable {
  const VehicleState({
    this.dataVehicle,
    this.status = StatusState.initial,
    this.currentIndex = 0,
  });

  final List<ElectrumBike>? dataVehicle;
  final StatusState status;
  final int currentIndex;

  VehicleState copyWith({
    List<ElectrumBike>? dataVehicle,
    StatusState? status,
    int? currentIndex,
  }) {
    return VehicleState(
      dataVehicle: dataVehicle ?? this.dataVehicle,
      status: status ?? this.status,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [dataVehicle, status, currentIndex];
}

final class VehicleInitial extends VehicleState {}
