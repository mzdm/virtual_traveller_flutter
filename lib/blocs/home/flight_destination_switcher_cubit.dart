import 'package:bloc/bloc.dart';

class FlightDestinationSwitcherCubit extends Cubit<int> {
  FlightDestinationSwitcherCubit() : super(0);

  void switchType() => emit(state == 0 ? 1 : 0);
}
