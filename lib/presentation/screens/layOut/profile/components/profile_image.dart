import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../utils/app_imgs.dart';
import '../../../../../utils/app_size.dart';

class ProfileImage extends StatelessWidget {
  final String image, selectedImage;
  final Function() function;

  const ProfileImage(
      {Key? key,
      required this.image,
      required this.function,
      required this.selectedImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        clipBehavior: Clip.none,
        children: [
          InkWell(
            onTap: () => showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )),
                ],
              ),
            ),
            child: Container(
              height: AppSize.h100,
              width: AppSize.w100,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: selectedImage == ''
                      ? Image.network(
                          image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        )
                      : Image.file(File(selectedImage))),
            ),
          ),
          Positioned(
            right: AppSize.w5,
            bottom: AppSize.h2,
            child: InkWell(
              onTap: function,
              child: Image.asset(
                AppIcons.editIcon,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
    );
  }
}
