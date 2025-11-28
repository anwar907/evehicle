part of 'package_bloc.dart';

class PackageState extends Equatable {
  const PackageState({this.status = StatusState.initial, this.packages});

  final List<RentalPackage>? packages;
  final StatusState status;

  PackageState copyWith({List<RentalPackage>? packages, StatusState? status}) {
    return PackageState(
      packages: packages ?? this.packages,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [packages, status];
}

final class PackageInitial extends PackageState {}
