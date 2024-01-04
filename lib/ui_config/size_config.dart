import 'package:flutter/widgets.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static late double textMultiplier;
  static late double imageSizeMultiplier;
  static late double heightMultiplier;
  static late double widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;


  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      screenWidth = constraints.maxWidth;
      screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      screenWidth = constraints.maxHeight;
      screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }
    _blockWidth = (screenWidth / 100);
    _blockHeight = (screenHeight / 100);

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;
  }

// Get the proportionate height as per screen size
  static double getProportionateScreenHeight(double inputHeight) {
    late double screenHeight = SizeConfig.screenHeight;
    // 812 is the layout height that designer use
    return (inputHeight / 812.0) * screenHeight!;
  }

  // Get the proportionate height as per screen size
  static double getProportionateScreenWidth(double inputWidth) {
    late double screenWidth = SizeConfig.screenWidth;
    // 375 is the layout width that designer use
    return (inputWidth / 375.0) * screenWidth!;
  }

  static printValues(){
    print("Height Multiplier : $heightMultiplier");
    print("Width Multiplier : $widthMultiplier");
    print("Image Size Multiplier : $imageSizeMultiplier");
    print("Text Multiplier : $textMultiplier");
    print("------------------------------------------------");
    print("Height : $screenWidth");
    print("Width : $screenHeight");
    print("Portrait : $isPortrait");
    print("MobilePortrait : $isMobilePortrait");
  }
}

dynamicTextSize(double size){
  return SizeConfig.textMultiplier * size;
}

dynamicImageSize(double size){
  return SizeConfig.imageSizeMultiplier * size;
}
dynamicHeight(double size){
  return SizeConfig.heightMultiplier * size;
}

dynamicWidth(double size){
  return SizeConfig.widthMultiplier * size;
}

dynamicPadding(double size){
  return SizeConfig.textMultiplier * size;
}