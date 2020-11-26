import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_traveller_flutter/blocs/home/bottom_nav_bar/bottom_nav_bar_cubit.dart';

void main() {
  BottomNavBarCubit bottomNavBarCubit;

  setUp(() {
    bottomNavBarCubit = BottomNavBarCubit();
  });

  test('starting index at 0', () {
    expect(bottomNavBarCubit.state, 0);
  });

  blocTest<BottomNavBarCubit, int>(
    'emits [1] when we go to index 1',
    build: () => bottomNavBarCubit,
    act: (cubit) => cubit.changeNavBarItem(1),
    expect: [1],
  );

  blocTest<BottomNavBarCubit, int>(
    'emits [3] when we go to index 3',
    build: () => bottomNavBarCubit,
    act: (cubit) => cubit.changeNavBarItem(3),
    expect: [3],
  );

  group('emits nothing when we go to the same index', () {
    blocTest<BottomNavBarCubit, int>(
      'emits [1, 2, 3, 0] when we go to index 1, 2, again 2, 3, 0',
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

    group('scenarios when cubit re-notify listeners', () {
      // issue - blocTest always emit first state even first state equals initial:
      // ONLY works for first time with 0 index because "blocs needs to "reignite" (re-notify) listeners"
      // see: https://github.com/felangel/bloc/issues/1829
      blocTest<BottomNavBarCubit, int>(
        'emits [0] when we are at the starting index (0) - cubit re-notifies listeners',
        build: () => bottomNavBarCubit,
        act: (cubit) => cubit.changeNavBarItem(0),
        expect: [0],
      );

      // so firstly call a cubit function to omit that first emitted value
      blocTest<BottomNavBarCubit, int>(
        'emits nothing when we go to the same index',
        build: () => bottomNavBarCubit..changeNavBarItem(1),
        act: (cubit) => cubit.changeNavBarItem(1),
        expect: [],
      );

      // or do one skip
      blocTest<BottomNavBarCubit, int>(
        'emits nothing when we go to the same index',
        build: () => bottomNavBarCubit,
        act: (cubit) => cubit.changeNavBarItem(0),
        skip: 1,
        expect: [],
      );

      // or start with seeded value
      blocTest<BottomNavBarCubit, int>(
        'emits nothing when we go to the same index',
        build: () => bottomNavBarCubit,
        seed: 0,
        act: (cubit) => cubit.changeNavBarItem(0),
        expect: [],
      );
    });
  });
}
