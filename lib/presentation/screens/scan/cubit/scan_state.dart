part of 'scan_cubit.dart';

@immutable
abstract class ScanState extends Equatable {
  const ScanState();

  @override
  List<Object?> get props => [];
}

class ScanInitial extends ScanState {}

class ScanBlindIdLoading extends ScanState {}

class ScanBindSuccess extends ScanState {}

class ScanBlindError extends ScanState {
  final String messageError;

  const ScanBlindError({required this.messageError});

  @override
  List<Object?> get props => [messageError];
}
