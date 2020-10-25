part of 'hotels_cubit.dart';

abstract class HotelsState extends Equatable {
  const HotelsState();
}

class HotelsInitial extends HotelsState {
  @override
  List<Object> get props => [];
}

class HotelsLoading extends HotelsState {
  @override
  List<Object> get props => [];
}

class HotelsSuccess extends HotelsState {
  const HotelsSuccess(this.hotels);

  final List<Hotel> hotels;

  @override
  List<Object> get props => [hotels];
}

class HotelsEmpty extends HotelsState {
  @override
  List<Object> get props => [];
}

class HotelsFailure extends HotelsState {
  const HotelsFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
