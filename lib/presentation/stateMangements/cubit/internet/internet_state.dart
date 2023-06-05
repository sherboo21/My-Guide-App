import 'package:equatable/equatable.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object?> get props => [];
}

class InternetInitial extends InternetState {}

class ConnectedState extends InternetState {
  final String message;

  const ConnectedState({required this.message});

  @override
  List<Object?> get props => [message];
}

class NotConnectedState extends InternetState {
  final String message;

  const NotConnectedState({required this.message});

  @override
  List<Object?> get props => [message];
}
