import 'package:flutter/material.dart';
import 'package:frist_pages/core/utils/extension.dart';
import 'package:frist_pages/features/verification/view/page/verification_code_page.dart';



class ButtonForgotWidget extends StatelessWidget {
  const ButtonForgotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
        
      child :  FilledButton(
          style:  ButtonStyle(
            backgroundColor:
            MaterialStatePropertyAll(context.forgroundColor),
            shape:
            MaterialStateProperty.all<RoundedRectangleBorder>(
           RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(10.0), 
            ),
        )),
           
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (v) {
              return const  VerificationPage();
            }
            )
            );
          },
          child: const Text(
            'Send Code',
            style: TextStyle(
              color: Colors.white,),
          ),
          ),
        ),
      ],
    );
  }
}
