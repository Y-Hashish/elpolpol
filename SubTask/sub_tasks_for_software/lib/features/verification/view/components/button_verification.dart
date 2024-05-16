import 'package:flutter/material.dart';
import 'package:frist_pages/core/utils/extension.dart';
import 'package:frist_pages/features/menuItem/view/menuPage.dart';
import 'package:frist_pages/features/myCart/view/page/cart_page.dart';
import 'package:frist_pages/features/registration/view/page/regisration_page.dart';


class ButtonVerificationWidget extends StatelessWidget {
  const ButtonVerificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          child: FilledButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(context.forgroundColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (v) {
                return MyApp();
              }));
            },
            child: const Text(
              'Reset Password',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
