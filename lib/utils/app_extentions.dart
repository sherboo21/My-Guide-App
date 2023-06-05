import 'package:flutter/material.dart';

// App SizedBox Extension //

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(height: toDouble());

  SizedBox get pw => SizedBox(width: toDouble());
}

// App Padding Extension //

extension CustomPadding on Widget {
  // padding all //
  addAllPadding(double val) => Padding(
        padding: EdgeInsets.all(val),
        child: this,
      );

  // padding symmetric //
  addSymmetricPadding({double? hVal, double? vVal}) => Padding(
        padding:
            EdgeInsets.symmetric(horizontal: hVal ?? 0, vertical: vVal ?? 0),
        child: this,
      );

  // padding only //
  addOnlyPadding({double? tVal, double? bVal, double? lVal, double? rVal}) =>
      Padding(
        padding: EdgeInsets.only(
            top: tVal ?? 0,
            bottom: bVal ?? 0,
            left: lVal ?? 0,
            right: rVal ?? 0),
        child: this,
      );
}

// extension that define gird view cross axis count for different devices //
extension AdaptiveGridViewCount on BuildContext {
  T withFormFactor<T>({
    required T onMobile,
    required T onTablet,
    required T onDesktop,
    bool followDeviceOrientation = true,
  }) {
    final formFactor =
        this.formFactor(followDeviceOrientation: followDeviceOrientation);
    return formFactor.isMobile
        ? onMobile
        : formFactor.isTablet
            ? onTablet
            : onDesktop;
  }

  FormFactor formFactor({bool followDeviceOrientation = true}) {
    final width = followDeviceOrientation
        ? mediaQuery.size.width
        : mediaQuery.size.shortestSide;
    return width > ScreenWidthBreakPoints.desktop
        ? FormFactor.desktop
        : width > ScreenWidthBreakPoints.tablet
            ? FormFactor.tablet
            : FormFactor.mobile;
  }
}

enum FormFactor { desktop, tablet, mobile }

class ScreenWidthBreakPoints {
  static const double desktop = 900;
  static const double tablet = 600;
  static const double mobile = 300;
}

extension FormFactorHelpers on FormFactor {
  bool get isDesktop => this == FormFactor.desktop;

  bool get isTablet => this == FormFactor.tablet;

  bool get isMobile => this == FormFactor.mobile;
}

extension BuildContextEx on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}
