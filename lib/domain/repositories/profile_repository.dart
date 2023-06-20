import 'package:my_guide/data/repositoriesImpl/profile_repository_impl.dart';

import '../../presentation/screens/layOut/profile/cubit/profile_state.dart';

class ProfileRepository {
  ProfileRepositoryImpl profileRepositoryImpl = ProfileRepositoryImpl();

  // get profile repository //

  Future<dynamic> getProfile({
    required emit,
    required ProfileState successState,
    loadingState,
    errorState,
  }) async {
    try {
      dynamic data = await profileRepositoryImpl.getProfile(
        emit: emit,
        successState: successState,
        loadingState: loadingState,
        errorState: errorState,
      );
      return data;
    } catch (e) {
      rethrow;
    }
  }
  // get relative profile repository //

  Future<dynamic> getRelativeProfile({
    required emit,
  }) async {
    try {
      dynamic data = await profileRepositoryImpl.getRelativeProfile(
        emit: emit,
      );
      return data;
    } catch (e) {
      rethrow;
    }
  }

// update profile repository //

  Future<dynamic> updateProfile({
    required emit,
    required ProfileState successState,
    loadingState,
    errorState,
    validateState,
    required String name,
    required String email,
    required String phoneNumber,
    required String imagePath,
    required int age,
  }) async {
    dynamic data = await profileRepositoryImpl.updateProfile(
        emit: emit,
        successState: successState,
        loadingState: loadingState,
        errorState: errorState,
        validateState: validateState,
        email: email,
        phoneNumber: phoneNumber,
        age: age,
        name: name,
        imagePath: imagePath);
    return data;
  }
}
