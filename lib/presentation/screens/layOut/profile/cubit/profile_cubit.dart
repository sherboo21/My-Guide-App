import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_guide/domain/models/profile.dart';
import 'package:my_guide/domain/models/relative_profile.dart';
import 'package:my_guide/domain/repositories/profile_repository.dart';
import 'package:my_guide/presentation/screens/layOut/profile/cubit/profile_state.dart';

import '../../../../../utils/app_strings.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  ProfileRepository profileRepository = ProfileRepository();

  // Data Model //
  ProfileDataModel profileDataModel = ProfileDataModel();
  RelativeProfileDataModel relativeProfileDataModel = RelativeProfileDataModel();

  // get Profile cubit //

  void getProfile() async {
    profileDataModel = await profileRepository.getProfile(
        emit: emit,
        loadingState: GetProfileLoadingState(),
        successState:
            GetProfileSuccessState(profileDataModel.message.toString()),
        errorState:
            GetProfileErrorState(messageError: AppStrings.anErrorOccurred));
  }
  // get relative Profile cubit //

  void getRelativeProfile() async {
    relativeProfileDataModel = await profileRepository.getRelativeProfile(
        emit: emit);
  }

  // update Profile cubit //

  void updateProfile(
      {required String name,
      email,
      phoneNumber,
      imagePath,
      required int aga}) async {
    await profileRepository.updateProfile(
        emit: emit,
        loadingState: UpdateProfileLoadingState(),
        successState:
            UpdateProfileSuccessState(profileDataModel.message.toString()),
        validateState: UpdateProfileValidateState(
            messageError: AppStrings.validateMessage),
        errorState:
            UpdateProfileErrorState(messageError: AppStrings.anErrorOccurred),
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        age: aga,
        imagePath: imagePath);
  }
}
