import 'package:my_guide/data/repositoriesImpl/location_repository_impl.dart';

import '../../presentation/screens/useYourLocation/cubit/location_cubit.dart';

class LocationRepository {
  LocationRepositoryImpl locationRepositoryImpl = LocationRepositoryImpl();

  // send location repository //
  Future<dynamic> sendLocation({
    required void Function(LocationState) emit,
    required LocationState successState,
    loadingState,
    errorState,
    required String lat,
    long,
  }) async {
    try {
      dynamic data = await locationRepositoryImpl.sendLocation(
          emit: emit,
          successState: successState,
          loadingState: loadingState,
          errorState: errorState,
          lat: lat,
          long: long);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
