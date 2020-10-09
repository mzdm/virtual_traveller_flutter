import 'package:bloc/bloc.dart';

class FlightDestinationSearchSwitcherCubit extends Cubit<int> {
  FlightDestinationSearchSwitcherCubit() : super(0);

  void switchType(int currentIndex) {
    if (currentIndex == 0) {
      emit(1);
    } else {
      emit(0);
    }
  }
}
