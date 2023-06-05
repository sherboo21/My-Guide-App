import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:my_guide/presentation/screens/auth/signIn/components/sign_in_data.dart';
import 'package:my_guide/presentation/screens/auth/signIn/components/sign_in_form.dart';
import 'package:my_guide/presentation/screens/auth/signIn/components/sign_in_item.dart';
import 'package:my_guide/presentation/widgets/custom_app_bar.dart';
import 'package:my_guide/presentation/widgets/custom_text.dart';
import 'package:my_guide/utils/app_extentions.dart';
import 'package:my_guide/utils/app_size.dart';

import '../../../../config/router/named_router.dart';
import '../../../../config/router/named_router_impl.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/main_functions.dart';
import '../../../widgets/custom_loading_indicator.dart';
import '../../../widgets/custom_rich_text.dart';
import 'components/sign_in_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  SignInData signInData = SignInData();

  @override
  void dispose() {
    signInData.passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          customNotificationToast(
              context: context,
              content: AppStrings.successfullyLoggedIn,
              color: AppColors.buttonAppColor);
          var mNamedNavigator = NamedNavigatorImpl();
          mNamedNavigator.push(Routes.layOutROUTER, replace: true, clean: true);
        } else if (state is LoginErrorState) {
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
              leadingFunction: () {
                var mNamedNavigator = NamedNavigatorImpl();
                mNamedNavigator.push(Routes.scanROUTER,
                    replace: false, clean: false);
              },
            ),
            body: Form(
              key: signInData.formKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: AppSize.w15),
                child: Center(
                  child: Column(
                    children: [
                      const SignInItem(),
                      AppSize.h40.ph,
                      SignInForm(
                        state: state,
                        emailController: signInData.emailController,
                        passwordController: signInData.passwordController,
                        passwordFocusNode: signInData.passwordFocusNode,
                      ),
                      AppSize.h5.ph,
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: CustomAppText(
                          text: AppStrings.forgetPassword,
                          textColor: AppColors.buttonAppColor,
                        ),
                      ),
                      AppSize.h30.ph,
                      state is! LoginLoadedState
                          ? SignInButton(
                              function: () {
                                if (signInData.formKey.currentState!
                                    .validate()) {
                                  authCubit.login(
                                    email: signInData.emailController.text,
                                    password:
                                        signInData.passwordController.text,
                                  );
                                }
                              },
                            )
                          : const CustomLoadingIndicator(),
                      AppSize.h45.ph,
                      CustomAppRichText(
                        text1: AppStrings.idontHaveAnAccount,
                        text2: ' ${AppStrings.signUp}',
                        text1Size: 16.sp,
                        text2color: AppColors.buttonAppColor,
                        text2Function: () {
                          var mNamedNavigator = NamedNavigatorImpl();
                          mNamedNavigator.push(Routes.whoAreYouROUTER,
                              replace: false, clean: false);
                        },
                      ),
                      AppSize.h10.ph,
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
