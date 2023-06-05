import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:my_guide/presentation/screens/auth/logOut/components/log_out_buttons.dart';
import 'package:my_guide/utils/app_extentions.dart';

import '../../../../config/router/named_router.dart';
import '../../../../config/router/named_router_impl.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../utils/app_size.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/main_functions.dart';
import '../../../widgets/custom_text.dart';

class LogOutAlertDialog extends StatelessWidget {
  const LogOutAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogOutSuccessState) {
          customNotificationToast(
              context: context,
              color: AppColors.errorColor,
              content: AppStrings.successfullyLoggedOut);
          var mNamedNavigator = NamedNavigatorImpl();
          mNamedNavigator.push(Routes.signInROUTER, replace: true, clean: true);
        } else if (state is LogOutErrorState) {
          customNotificationToast(
              context: context,
              color: AppColors.errorColor,
              content: state.messageError);
        }
      },
      builder: (context, state) {
        var authCubit = context.read<AuthCubit>();
        return Column(
          children: [
            CustomAppText(
              text: AppStrings.doYouSureYouWantToLogOut,
              textColor: AppColors.secondaryAppColor,
              textAlign: TextAlign.center,
              textSize: 24.sp,
            ).addSymmetricPadding(hVal: AppSize.w20),
            AppSize.h20.ph,
            Divider(
              color: AppColors.secondaryAppColor,
            ),
            LogOutButtons(
                state: state,
                noFunction: () => Navigator.pop(context),
                yesFunction: () => authCubit.logOut()),
            AppSize.h20.ph,
          ],
        );
      },
    );
  }
}
