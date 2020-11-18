part of 'geo_cubit.dart';

abstract class GeoState extends Equatable {
  const GeoState();
}

class GeoInitial extends GeoState {
  @override
  List<Object> get props => [];
}

class GeoLoading extends GeoState {
  @override
  List<Object> get props => [];
}

class GeoSuccess extends GeoState {
  const GeoSuccess(this.geoData);

  final Airport geoData;

  @override
  List<Object> get props => [geoData];
}

class GeoFailure extends GeoState {
  const GeoFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
