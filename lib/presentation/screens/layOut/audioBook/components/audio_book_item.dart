import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/presentation/screens/layOut/audioBook/audioBookDetails/audio_book_details_screen.dart';
import 'package:my_guide/utils/app_extentions.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../utils/app_size.dart';
import '../../../../widgets/custom_text.dart';

class AudioBookItem extends StatelessWidget {
  final String image, title, desc;
  final int id;

  const AudioBookItem(
      {Key? key,
      required this.image,
      required this.title,
      required this.desc,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AudioBookDetailsScreen(
                    id: id,
                  ))),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          image,
          fit: BoxFit.cover,
          height: AppSize.h60,
          width: AppSize.w60,
        ),
      ),
      title: CustomAppText(
        text: title,
        textWeight: FontWeight.w700,
        textSize: 16.sp,
        textColor: AppColors.buttonAppColor,
      ),
      subtitle: CustomAppText(
        text: desc,
        textWeight: FontWeight.w700,
        textColor: const Color.fromRGBO(6, 52, 85, 0.7),
        textSize: 12.sp,
      ).addOnlyPadding(tVal: AppSize.h7),
      trailing: Icon(
        Icons.more_horiz,
        color: AppColors.buttonAppColor,
      ),
    );
  }
}
