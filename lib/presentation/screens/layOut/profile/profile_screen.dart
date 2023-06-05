import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_guide/config/theme/app_colors.dart';
import 'package:my_guide/presentation/screens/layOut/components/layOut_app_bar.dart';
import 'package:my_guide/presentation/screens/layOut/profile/components/profile_data.dart';
import 'package:my_guide/presentation/screens/layOut/profile/components/profile_gender.dart';
import 'package:my_guide/presentation/screens/layOut/profile/components/profile_image.dart';
import 'package:my_guide/presentation/screens/layOut/profile/cubit/profile_cubit.dart';
import 'package:my_guide/presentation/screens/layOut/profile/cubit/profile_state.dart';
import 'package:my_guide/presentation/widgets/custom_loading_indicator.dart';
import 'package:my_guide/presentation/widgets/custom_text.dart';
import 'package:my_guide/utils/app_extentions.dart';
import 'package:my_guide/utils/app_size.dart';
import 'package:my_guide/utils/app_strings.dart';

import '../../../../utils/main_functions.dart';
import '../../../widgets/customDrawer/custom_drawer.dart';
import 'components/profile_button.dart';
import 'components/profile_form.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileData profileData = ProfileData();
  String _selectedImage = '';

  _selectImageFromGallery() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (file != null) {
        _selectedImage = file.path;
      } else {
        _selectedImage = '';
      }
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProfile();
  }

  @override
  void dispose() {
    profileData.passwordFocusNode.dispose();
    profileData.emailFocusNode.dispose();
    profileData.phoneNumberFocusNode.dispose();
    profileData.ageFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is GetProfileErrorState || state is UpdateProfileErrorState) {
          customNotificationToast(
              context: context,
              content: AppStrings.anErrorOccurred,
              color: AppColors.errorColor);
        } else if (state is UpdateProfileSuccessState) {
          customNotificationToast(
              context: context,
              content: AppStrings.updatedProfileSuccessfully,
              color: AppColors.buttonAppColor);
          context.read<ProfileCubit>().getProfile();
        } else if (state is UpdateProfileValidateState) {
          customNotificationToast(
              context: context,
              content: state.messageError,
              color: AppColors.errorColor);
        }
      },
      builder: (context, state) {
        var profileCubit = context.read<ProfileCubit>();
        var profileDataModel = profileCubit.profileDataModel.data;
        return Scaffold(
            drawer: const CustomDrawer(),
            appBar: LayOutAppBar(
              title: AppStrings.profile,
            ),
            body: ConditionalBuilder(
                condition: state is! GetProfileLoadingState &&
                    profileDataModel != null,
                builder: (context) => Visibility(
                      visible: state is GetProfileErrorState,
                      replacement: Form(
                        key: profileData.formKey,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              AppSize.h20.ph,
                              ProfileImage(
                                image: profileDataModel!.image!,
                                selectedImage: _selectedImage,
                                function: () => _selectImageFromGallery(),
                              ),
                              AppSize.h30.ph,
                              ProfileForm(
                                profileCubit: profileCubit,
                                fullNameController:
                                    profileData.fullNameController,
                                emailController: profileData.emailController,
                                phoneNumberController:
                                    profileData.phoneNumberController,
                                ageController: profileData.ageController,
                                emailFocusNode: profileData.emailFocusNode,
                                phoneNumberFocusNode:
                                    profileData.phoneNumberFocusNode,
                                ageFocusNode: profileData.ageFocusNode,
                              ),
                              ProfileGender(
                                profileCubit: profileCubit,
                              ),
                              AppSize.h30.ph,
                              state is! UpdateProfileLoadingState
                                  ? ProfileButton(
                                      function: () => profileCubit.updateProfile(
                                          name: profileData.fullNameController.text.isNotEmpty
                                              ? profileData
                                                  .fullNameController.text
                                              : profileDataModel.name!,
                                          email: profileData.emailController.text.isNotEmpty
                                              ? profileData.emailController.text
                                              : profileDataModel.email,
                                          phoneNumber: profileData
                                                  .emailController
                                                  .text
                                                  .isNotEmpty
                                              ? profileData
                                                  .phoneNumberController.text
                                              : profileDataModel.phoneNumber,
                                          aga: profileData.ageController.text.isNotEmpty
                                              ? int.parse(profileData
                                                  .ageController.text)
                                              : profileDataModel.age!,
                                          imagePath: _selectedImage.isEmpty
                                              ? profileDataModel.image
                                              : _selectedImage),
                                    )
                                  : const CustomLoadingIndicator(),
                              AppSize.h80.ph,
                            ],
                          ).addSymmetricPadding(hVal: AppSize.w15),
                        ),
                      ),
                      child: Center(
                          child: CustomAppText(
                        text: AppStrings.anErrorOccurred,
                        textSize: 24.sp,
                        textColor: AppColors.errorColor,
                      )),
                    ),
                fallback: (context) => const CustomLoadingIndicator()));
      },
    );
  }
}
