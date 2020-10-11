import 'package:bloc/bloc.dart';

class FlightDestinationSearchSwitcherCubit extends Cubit<int> {
  FlightDestinationSearchSwitcherCubit() : super(0);

  void switchType() => emit(state == 0 ? 1 : 0);
}
