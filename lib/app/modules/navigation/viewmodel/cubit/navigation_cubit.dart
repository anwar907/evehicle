import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);

  final List<IconData> listIcon = [Icons.home, Icons.map_sharp, Icons.person];

  void changePage(int index) => emit(index);
}
