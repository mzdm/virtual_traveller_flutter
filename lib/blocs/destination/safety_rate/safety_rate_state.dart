part of 'safety_rate_cubit.dart';

abstract class SafetyRateState extends Equatable {
  const SafetyRateState();
}

class SafetyRateInitial extends SafetyRateState {
  @override
  List<Object?> get props => [];
}

class SafetyRateSuccess extends SafetyRateState {
  const SafetyRateSuccess(this.result);

  final _SafetyResult result;

  @override
  List<Object?> get props => [result];
}

class SafetyRateFailure extends SafetyRateState {
  const SafetyRateFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
