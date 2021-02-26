import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('${bloc.toString()} onEvent:\n$event');
    super.onEvent(bloc, event);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    debugPrint('${bloc.toString()} onError:\n$error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('${bloc.toString()} onTransition:\n$transition');
    super.onTransition(bloc, transition);
  }
}
