import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:my_guide/config/theme/app_colors.dart';
import 'package:my_guide/data/dataSources/local/shared_prefrences.dart';
import 'package:my_guide/presentation/screens/scan/cubit/scan_cubit.dart';
import 'package:my_guide/utils/app_extentions.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../utils/app_imgs.dart';
import '../../../../utils/app_size.dart';

class QrCode extends StatelessWidget {
  QrCode({Key? key}) : super(key: key);
  MobileScannerController mobileScannerController = MobileScannerController();
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppIcons.vectorIcon1,
              fit: BoxFit.contain,
            ),
            Image.asset(
              AppIcons.vectorIcon4,
              fit: BoxFit.contain,
            )
          ],
        ).addSymmetricPadding(hVal: AppSize.w25),
        Visibility(
          visible: StartPrefs.getUserTypeValue() == 'BLIND',
          replacement: SizedBox(
            height: 260.h,
            width: 260.w,
            child: MobileScanner(
              controller: mobileScannerController,
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                for (final barcode in barcodes) {
                  debugPrint('Barcode found! ${barcode.rawValue}');
                  context
                      .read<ScanCubit>()
                      .scanBlindId(id: int.parse(barcode.rawValue!));
                }
              },
            ),
          ),
          child: SizedBox(
            height: 265.h,
            width: 265.w,
            child: Center(
              child: QrImage(
                  data: StartPrefs.getUserId().toString(),
                  version: QrVersions.auto,
                  backgroundColor: StartPrefs.getThemeValue() == false
                      ? Colors.white
                      : AppColors.darkThemeScaffoldColor),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppIcons.vectorIcon2,
              fit: BoxFit.contain,
            ),
            Image.asset(
              AppIcons.vectorIcon3,
              fit: BoxFit.contain,
            )
          ],
        ).addSymmetricPadding(hVal: AppSize.w25),
      ],
    );
  }
}
