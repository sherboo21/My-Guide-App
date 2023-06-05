import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final Color? background;
  final Color? borderColor;
  final double? radius;
  final Function()? onTap;
  final double? elevation;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.child,
    this.width,
    this.height,
    this.background,
    this.borderColor,
    this.radius,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? double.infinity,
      width: width ?? double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: elevation ?? 0.0,
            minimumSize:
                Size(width ?? double.infinity, height ?? double.infinity),
            backgroundColor: background ?? Colors.transparent,
            side: BorderSide(color: borderColor ?? Colors.transparent),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 8),
            ),
          ),
          onPressed: onTap ?? () {},
          child: child!),
    );
  }
}
