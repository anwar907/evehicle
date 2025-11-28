part of 'vehicle_bloc.dart';

sealed class VehicleEvent extends Equatable {
  const VehicleEvent();

  @override
  List<Object> get props => [];
}

class FetchVehiclesEvent extends VehicleEvent {}

class ChangeVehicleIndexEvent extends VehicleEvent {
  final int index;
  const ChangeVehicleIndexEvent(this.index);

  @override
  List<Object> get props => [index];
}
