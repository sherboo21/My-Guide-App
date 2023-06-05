import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/repositories/auth_reposirory.dart';
import '../../../../utils/app_strings.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthRepository authRepository = AuthRepository();

  // Auth Register Cubit //

  void register({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
    required int age,
    required String gender,
  }) async {
    await authRepository.register(
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        age: age,
        gender: gender,
        name: name,
        emit: emit,
        loadingState: RegisterLoadingState(),
        successState: RegisterSuccessState(),
        errorState:
            RegisterErrorState(messageError: AppStrings.anErrorOccurred));
  }

  // Auth log in Cubit //

  void login({
    required String email,
    required String password,
  }) async {
    await authRepository.login(
        email: email,
        password: password,
        emit: emit,
        loadingState: LoginLoadedState(),
        successState: LoginSuccessState(),
        errorState: LoginErrorState(messageError: AppStrings.anErrorOccurred));
  }

  // Auth log out  Cubit //

  void logOut() async {
    await authRepository.logOut(
        emit: emit,
        loadingState: LogOutLoadedState(),
        successState: LogOutSuccessState(),
        errorState: LogOutErrorState(messageError: AppStrings.anErrorOccurred));
  }
}
