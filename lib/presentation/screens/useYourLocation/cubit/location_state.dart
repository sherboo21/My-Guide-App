part of 'location_cubit.dart';

@immutable
abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}

class LocationInitial extends LocationState {}

class LocationSuccessState extends LocationState {}

class LocationLoadingState extends LocationState {}

class LocationErrorState extends LocationState {
  final String messageError;

  const LocationErrorState({required this.messageError});

  @override
  List<Object?> get props => [messageError];
}
