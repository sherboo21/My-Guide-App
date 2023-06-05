import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_guide/domain/repositories/location_repository.dart';

import '../../../../utils/app_strings.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  LocationRepository locationRepository = LocationRepository();

// send location function //
  void sendLocation({
    required String lat,
    long,
  }) async {
    await locationRepository.sendLocation(
        lat: lat,
        long: long,
        emit: emit,
        loadingState: LocationSuccessState(),
        successState: LocationLoadingState(),
        errorState:
            LocationErrorState(messageError: AppStrings.anErrorOccurred));
  }
}
