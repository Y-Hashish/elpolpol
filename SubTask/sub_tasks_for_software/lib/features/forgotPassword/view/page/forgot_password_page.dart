import 'package:flutter/material.dart';
import 'package:frist_pages/core/utils/extension.dart';
import 'package:frist_pages/features/forgotPassword/view/components/button_forgot_widget.dart';
import 'package:frist_pages/features/forgotPassword/view/components/forgot_password_widget.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: const Color.fromARGB(255, 28, 41, 126),
        title: const Text(" "),
      ),
      body: Stack(
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     color: const Color.fromARGB(255, 54, 55, 55),
          //     image: DecorationImage(
          //       image: const AssetImage('assets/images/background.jpg'), // Adjust path to your image
          //       fit: BoxFit.cover,
          //       colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
          //     ),
          //   ),
          // ),
          Column(
            children: [
              Image.asset(
                "assets/images/logo.jpg",
                height: 200,
              ),
              const Expanded(
                child: ForgotPasswordWidget(),
              ),
              const SizedBox(
                height: 100,
                child: ButtonForgotWidget(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
