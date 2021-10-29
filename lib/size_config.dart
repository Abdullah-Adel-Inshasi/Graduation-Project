import 'package:flutter/material.dart';

class SizeConfig {
  static double _screenWidth=0;
  static double _screenHeight=0;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double textMultiplier=0;
  static double imageSizeMultiplier=0;
  static double heightMultiplier=0;
  static double widthMultiplier=0;
  static double deviceRatio=0;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  static MediaQueryData? _mediaQueryData;


  void init(BuildContext context) {

    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData!.size.width;
    _screenHeight = _mediaQueryData!.size.height;

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;
    deviceRatio = _screenWidth / _screenHeight;

  }

  static double scaleTextFont(double fontSize) {
    double scale = fontSize / 8.96;
    return (textMultiplier * scale);
  }

  static double scaleWidth(double width) {
    double scale = width / 4.14;
    return (widthMultiplier * scale);
  }

  static double scaleHeight(double height) {
//    double scale = height / 8.7;
    double scale = height / 9.1;
    return (heightMultiplier * scale);
  }
}

//class SizeConfig {
//  static MediaQueryData _mediaQueryData;
//  static double screenWidth;
//  static double screenHeight;
//  static double blockSizeHorizontal;
//  static double blockSizeVertical;
//
//  static double _safeAreaHorizontal;
//  static double _safeAreaVertical;
//  static double safeBlockHorizontal;
//  static double safeBlockVertical;
//
//  void init(BuildContext context) {
//    _mediaQueryData = MediaQuery.of(context);
//    screenWidth = _mediaQueryData.size.width;
//    screenHeight = _mediaQueryData.size.height;
//    blockSizeHorizontal = screenWidth / 100;
//    blockSizeVertical = screenHeight / 100;
//
//    _safeAreaHorizontal =
//        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
//    _safeAreaVertical =
//        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
//    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
//    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
//  }
//
//  static double scaleTextFont(double fontSize) {
//    double scale = fontSize / 4.14;
//    return ((safeBlockHorizontal * scale));
//  }
//
//  static double scaleWidth(double width) {
//    double scale = width / 4.14;
//    return ((blockSizeHorizontal * scale));
//  }
//
//  static double scaleHeight(double height) {
////    double scale = height / 8.7;
//    double scale = height / 9.0;
//    return ((blockSizeVertical * scale));
//  }
//}
