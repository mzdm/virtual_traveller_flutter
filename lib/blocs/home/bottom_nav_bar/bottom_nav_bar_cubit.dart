import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class BottomNavBarCubit extends Cubit<int> {
  BottomNavBarCubit() : super(0);

  void changeNavBarItem(int newIndex) => emit(newIndex);
}
