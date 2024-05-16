// import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:frist_pages/features/auth/registration/view/page/regisration_page.dart';

class OnboardingModel {
  late String image, title, subtitle;
  late Color color;
  OnboardingModel({
    required this.image,
    required this.title,
    required this.subtitle,
    this.color = Colors.amber,
    
  });
}
