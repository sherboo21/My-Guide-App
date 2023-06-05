import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/config/theme/app_colors.dart';
import 'package:my_guide/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:my_guide/presentation/screens/auth/signUp/components/sign_up_button.dart';
import 'package:my_guide/presentation/screens/auth/signUp/components/sign_up_data.dart';
import 'package:my_guide/presentation/screens/auth/signUp/components/sign_up_form.dart';
import 'package:my_guide/presentation/widgets/custom_app_bar.dart';
import 'package:my_guide/presentation/widgets/custom_loading_indicator.dart';
import 'package:my_guide/presentation/widgets/custom_rich_text.dart';
import 'package:my_guide/presentation/widgets/custom_text.dart';
import 'package:my_guide/utils/app_extentions.dart';
import 'package:my_guide/utils/app_size.dart';
import 'package:my_guide/utils/main_functions.dart';

import '../../../../config/router/named_router.dart';
import '../../../../config/router/named_router_impl.dart';
import '../../../../utils/app_strings.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpData signUpData = SignUpData();

  @override
  void dispose() {
    signUpData.emailFocusNode.dispose();
    signUpData.passwordFocusNode.dispose();
    signUpData.ageFocusNode.dispose();
    signUpData.genderFocusNode.dispose();
    signUpData.phoneNumberFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          customNotificationToast(
              context: context,
              content: AppStrings.accountCreatedSuccessfully,
              color: AppColors.buttonAppColor);
          var mNamedNavigator = NamedNavigatorImpl();
          mNamedNavigator.push(Routes.scanROUTER, replace: true, clean: true);
        } else if (state is RegisterErrorState) {
          customNotificationToast(
              context: context,
              content: state.messageError,
              color: AppColors.errorColor);
        }
      },
      builder: (context, state) {
        var authCubit = context.read<AuthCubit>();
        return Scaffold(
          appBar: CustomAppBar(
            height: 135.h,
            flexibleSpace: Container(
              padding: EdgeInsets.only(top: AppSize.h40),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topLeft,
                      colors: [
                        Colors.white,
                        Color(0xFF2C9BD8),
                      ]),
                  // color: Color(0xFFACEEF3),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(130))),
              child: Center(
                child: CustomAppText(
                  text: AppStrings.signUp,
                  textAlign: TextAlign.center,
                  textSize: 32.sp,
                  textWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          body: Form(
            key: signUpData.formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.w35),
                child: Column(
                  children: [
                    AppSize.h35.ph,
                    SignUpForm(
                        fullNameController: signUpData.fullNameController,
                        emailController: signUpData.emailController,
                        genderController: signUpData.genderController,
                        ageController: signUpData.ageController,
                        phoneNumberController: signUpData.phoneNumberController,
                        passwordController: signUpData.passwordController,
                        emailFocusNode: signUpData.emailFocusNode,
                        genderFocusNode: signUpData.genderFocusNode,
                        ageFocusNode: signUpData.ageFocusNode,
                        phoneNumberFocusNode: signUpData.phoneNumberFocusNode,
                        passwordFocusNode: signUpData.passwordFocusNode),
                    AppSize.h35.ph,
                    state is! RegisterLoadingState
                        ? SignUpButton(function: () {
                            if (signUpData.formKey.currentState!.validate()) {
                              authCubit.register(
                                  name: signUpData.fullNameController.text,
                                  email: signUpData.emailController.text,
                                  phoneNumber:
                                      signUpData.phoneNumberController.text,
                                  password: signUpData.passwordController.text,
                                  age: int.parse(signUpData.ageController.text),
                                  gender: signUpData.genderController.text
                                      .toUpperCase());
                            }
                          })
                        : const CustomLoadingIndicator(),
                    AppSize.h30.ph,
                    CustomAppRichText(
                      text1: AppStrings.alreadyHveAnAccount,
                      text2: ' ${AppStrings.signIn}',
                      text1Size: 16.sp,
                      text2color: AppColors.buttonAppColor,
                      text2Function: () {
                        var mNamedNavigator = NamedNavigatorImpl();
                        mNamedNavigator.push(Routes.signInROUTER,
                            replace: false, clean: false);
                      },
                    ),
                    AppSize.h10.ph,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
