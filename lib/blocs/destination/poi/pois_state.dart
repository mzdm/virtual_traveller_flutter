part of 'pois_cubit.dart';

abstract class PoisState extends Equatable {
  const PoisState();
}

class PoisInitial extends PoisState {
  @override
  List<Object> get props => [];
}

class PoisLoading extends PoisState {
  @override
  List<Object> get props => [];
}

class PoisSuccess extends PoisState {
  const PoisSuccess(this.pois);

  final List<POI> pois;

  @override
  List<Object> get props => [pois];
}

class PoisEmpty extends PoisState {
  @override
  List<Object> get props => [];
}

class PoisFailure extends PoisState {
  const PoisFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
