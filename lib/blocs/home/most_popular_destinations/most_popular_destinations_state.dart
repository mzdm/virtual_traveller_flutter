part of 'most_popular_destinations_cubit.dart';

abstract class MostPopularDestinationsState extends Equatable {
  const MostPopularDestinationsState();
}

class MostPopularDestinationsInitial extends MostPopularDestinationsState {
  @override
  List<Object?> get props => [];
}

class MostPopularDestinationsLoading extends MostPopularDestinationsState {
  @override
  List<Object?> get props => [];
}

class MostPopularDestinationsSuccess extends MostPopularDestinationsState {
  MostPopularDestinationsSuccess(this.data);

  final List<Destination> data;

  @override
  List<Object?> get props => [data];
}

class MostPopularDestinationsFailure extends MostPopularDestinationsState {
  MostPopularDestinationsFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
