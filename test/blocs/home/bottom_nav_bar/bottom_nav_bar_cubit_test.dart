import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_traveller_flutter/blocs/home/bottom_nav_bar/bottom_nav_bar_cubit.dart';

void main() {
  group('BottomNavBarCubit', () {
    BottomNavBarCubit bottomNavBarCubit;

    setUp(() {
      bottomNavBarCubit = BottomNavBarCubit();
    });

    test('starting index at 0', () {
      expect(bottomNavBarCubit.state, 0);
    });

    blocTest<BottomNavBarCubit, int>(
      'emits [1] when we change index to 1',
      build: () => bottomNavBarCubit,
      act: (cubit) => cubit.changeNavBarItem(1),
      expect: [1],
    );

    blocTest<BottomNavBarCubit, int>(
      'emits [3] when we change index to 3',
      build: () => bottomNavBarCubit,
      act: (cubit) => cubit.changeNavBarItem(3),
      expect: [3],
    );

    blocTest<BottomNavBarCubit, int>(
      'emits [1, 2, 2, 3, 0] when we change index to 3',
      build: () => bottomNavBarCubit,
      act: (cubit) {
        cubit
          ..changeNavBarItem(1)
          ..changeNavBarItem(2)
          ..changeNavBarItem(2)
          ..changeNavBarItem(3)
          ..changeNavBarItem(0);
      },
      expect: [1, 2, 3, 0],
    );

    // would not work for first time with 0 index because "blocs needs to "reignite" (re-notify) listeners"
    // https://github.com/felangel/bloc/issues/1829
    blocTest<BottomNavBarCubit, int>(
      'emits nothing when we click to same index',
      build: () => bottomNavBarCubit..changeNavBarItem(1),
      // seed: 1,
      act: (cubit) => cubit.changeNavBarItem(1),
      expect: [],
    );

    // or do 1 skip
    blocTest<BottomNavBarCubit, int>(
      'emits nothing when we click to same index',
      build: () => bottomNavBarCubit,
      act: (cubit) => cubit.changeNavBarItem(0),
      skip: 1,
      expect: [],
    );
  });
}
