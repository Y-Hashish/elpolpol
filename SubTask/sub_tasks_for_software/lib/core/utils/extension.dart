import 'package:flutter/material.dart';

extension BackgroundColor on BuildContext {
  Color get backgroundColor => const Color(0xffE6F5FA);
  Color get forgroundColor => const Color(0xff14238A);
}

extension Size on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}
