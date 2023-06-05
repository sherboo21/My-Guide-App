import '../../data/repositoriesImpl/auth_repository_impl.dart';
import '../../presentation/screens/auth/cubit/auth_cubit.dart';

class AuthRepository {
  AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl();

  // auth register repository //

  Future<dynamic> register({
    required emit,
    required AuthState successState,
    loadingState,
    errorState,
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
    required int age,
    required String gender,
  }) async {
    dynamic data = await authRepositoryImpl.register(
        emit: emit,
        successState: successState,
        loadingState: loadingState,
        errorState: errorState,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        age: age,
        gender: gender,
        name: name);
    return data;
  }

  // auth login repository //

  Future<dynamic> login({
    required emit,
    required AuthState successState,
    loadingState,
    errorState,
    required String email,
    required String password,
  }) async {
    dynamic data = await authRepositoryImpl.login(
        emit: emit,
        successState: successState,
        loadingState: loadingState,
        errorState: errorState,
        email: email,
        password: password);
    return data;
  }

  // auth log out repository //

  Future<dynamic> logOut({
    required emit,
    required AuthState successState,
    loadingState,
    errorState,
  }) async {
    dynamic data = await authRepositoryImpl.logOut(
      emit: emit,
      successState: successState,
      loadingState: loadingState,
      errorState: errorState,
    );
    return data;
  }
}
