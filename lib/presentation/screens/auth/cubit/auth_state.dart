part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

// register state //

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterErrorState extends AuthState {
  final String messageError;

  const RegisterErrorState({required this.messageError});

  @override
  List<Object?> get props => [messageError];
}

// log in state //

class LoginLoadedState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginErrorState extends AuthState {
  final String messageError;

  const LoginErrorState({required this.messageError});

  @override
  List<Object?> get props => [messageError];
}

// log out state //

class LogOutLoadedState extends AuthState {}

class LogOutSuccessState extends AuthState {}

class LogOutErrorState extends AuthState {
  final String messageError;

  const LogOutErrorState({required this.messageError});

  @override
  List<Object?> get props => [messageError];
}
