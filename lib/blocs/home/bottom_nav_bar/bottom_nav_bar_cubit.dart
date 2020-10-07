import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class BottomNavBarCubit extends Cubit<int> {
  BottomNavBarCubit() : super(0);

  void changeNavBarItem(int newIndex) => emit(newIndex);

  void pageTransitionEffect(
    PageController pageController, {
    bool isFromSettingsIcon = false,
  }) {
    pageController.animateToPage(
      state,
      duration: Duration(milliseconds: isFromSettingsIcon ? 500 : 250),
      curve: Curves.easeIn,
    );
  }
}
