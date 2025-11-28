part of 'promotions_bloc.dart';

class PromotionsState extends Equatable {
  const PromotionsState({this.promotions, this.status = StatusState.initial});

  final List<Promotion>? promotions;
  final StatusState status;

  PromotionsState copyWith({List<Promotion>? promotions, StatusState? status}) {
    return PromotionsState(
      promotions: promotions ?? this.promotions,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [promotions, status];
}

final class PromotionsInitial extends PromotionsState {}
