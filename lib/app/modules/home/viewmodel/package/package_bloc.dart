import 'package:equatable/equatable.dart';
import 'package:evehicle/app/utils/extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_repository/local_repository.dart';
import 'package:rental_package_repository/rental_package_repository.dart';

part 'package_event.dart';
part 'package_state.dart';

class PackageBloc extends Bloc<PackageEvent, PackageState> {
  PackageBloc({required RentalPackageRepository packageRepository})
    : _packageRepository = packageRepository,
      super(PackageInitial()) {
    on<FetchPackagesEvent>(fetchPackages);
  }

  final RentalPackageRepository _packageRepository;

  Future<void> fetchPackages(
    FetchPackagesEvent event,
    Emitter<PackageState> emit,
  ) async {
    try {
      emit(state.copyWith(status: StatusState.loading));
      final packages = await _packageRepository.getRentalPackages();
      emit(state.copyWith(status: StatusState.success, packages: packages));
    } catch (e) {
      emit(state.copyWith(status: StatusState.failure));
    }
  }
}
