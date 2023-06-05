import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/presentation/screens/layOut/audioBook/audioBookDetails/audio_book_details_screen.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../utils/app_imgs.dart';
import '../../../../../utils/app_size.dart';
import '../../../../widgets/custom_text.dart';

class HomeListItem extends StatelessWidget {
  final String image, title, author;
  final int id;

  const HomeListItem(
      {Key? key,
      required this.image,
      required this.title,
      required this.author,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AudioBookDetailsScreen(
                    id: id,
                  ))),
      child: Material(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(12),
        elevation: 10,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150.h,
              decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(
                        image,
                      ),
                      fit: BoxFit.cover)),
            ),
            Expanded(
              child: ListTile(
                title: CustomAppText(
                  text: title,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  textColor: AppColors.buttonAppColor,
                ),
                subtitle: CustomAppText(
                  text: author,
                  textSize: 12.sp,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  textWeight: FontWeight.w700,
                  textColor: const Color(0xFF2C9BD8),
                ),
                trailing: Container(
                  height: AppSize.h35,
                  width: AppSize.w35,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Center(
                    child: Image.asset(
                      AppIcons.playIcon,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
