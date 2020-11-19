import 'package:bloc/bloc.dart';

class LogoCounterCubit extends Cubit<List<String>> {
  LogoCounterCubit() : super(<String>[]);

  void logoFound(String id) {
    if (state != null && state.length < 3 && !state.contains(id)) {
      final currList = [...state]..add(id);
      emit(currList);
    }
  }
}
