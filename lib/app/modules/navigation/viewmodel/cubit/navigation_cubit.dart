import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);

  final List<IconData> listIcon = [Icons.home, Icons.map_sharp];

  void changePage(int index) => emit(index);
}
