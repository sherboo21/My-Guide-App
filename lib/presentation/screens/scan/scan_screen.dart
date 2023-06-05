import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_guide/presentation/screens/scan/components/qr_code.dart';
import 'package:my_guide/presentation/screens/scan/components/scan_button.dart';
import 'package:my_guide/presentation/screens/scan/components/scan_item.dart';
import 'package:my_guide/presentation/screens/scan/cubit/scan_cubit.dart';
import 'package:my_guide/presentation/screens/scan/scanDone/components/scan_done_item.dart';
import 'package:my_guide/utils/app_extentions.dart';
import 'package:my_guide/utils/app_size.dart';
import 'package:my_guide/utils/main_functions.dart';

import '../../../config/router/named_router.dart';
import '../../../config/router/named_router_impl.dart';
import '../../../config/theme/app_colors.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScanCubit, ScanState>(
      listener: (context, state) {
        if (state is ScanBindSuccess) {
          customBottomSheet(
            context: context,
            scrollController: scrollController,
            paddingHorizontal: AppSize.w20,
            paddingVertical: AppSize.h20,
            isDismissible: false,
            content: ScanDoneItem(
              function: () {
                var mNamedNavigator = NamedNavigatorImpl();
                mNamedNavigator.push(Routes.signInROUTER,
                    replace: true, clean: true);
              },
            ),
          );
        } else if (state is ScanBlindError) {
          customNotificationToast(
              context: context,
              content: state.messageError,
              color: AppColors.errorColor);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: AppSize.w20),
              children: [
                AppSize.h40.ph,
                const ScanItem(),
                AppSize.h100.ph,
                QrCode(),
                AppSize.h70.ph,
                ScanButton(function: () {
                  var mNamedNavigator = NamedNavigatorImpl();
                  mNamedNavigator.push(Routes.signInROUTER,
                      replace: true, clean: true);
                })
              ],
            ),
          ),
        );
      },
    );
  }
}
