part of 'navigation_cubit.dart';

@immutable
sealed class NavigationState {}

final class NavigationInitial extends NavigationState {}

final class ItemNavigationActive extends NavigationState {
  final String lable;
  final IconData iconData;

  ItemNavigationActive(this.iconData, this.lable);
}
