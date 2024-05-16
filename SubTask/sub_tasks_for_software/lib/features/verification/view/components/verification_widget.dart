import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frist_pages/core/utils/extension.dart';
import 'package:frist_pages/features/verification/controller/cubit/verification_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationWidget extends StatelessWidget {
  const VerificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerificationCubit(),
      child: BlocBuilder<VerificationCubit, VerificationState>(
        builder: (context, state) {
          final VerificationCubit controller =
              context.read<VerificationCubit>();
          // String validCode = '555555';
          // void onTapReset() {
          //   if (controller.pinCodeController.text == validCode) {
          //     Navigator.of(context).push(MaterialPageRoute(builder: (v) {
          //       return const RegistrationPage();
          //     }));
          //   } else {
          //     log("invalid code");
          //   }
          // }

          return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            const Text('Enter your Code To Verify',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff14238A),
                )),
            const Padding(padding: EdgeInsets.symmetric(vertical: 40)),
            PinCodeTextField(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              appContext: context,
              pastedTextStyle: TextStyle(
                color: context.forgroundColor,
                fontWeight: FontWeight.bold,
              ),
              length: 5,
              obscureText: true,
              obscuringCharacter: '*',
              animationType: AnimationType.fade,
              validator: (v) {
                if (v!.length < 3) {
                  return "I'm from validator";
                }
                // onTapReset();
                return null; 
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                inactiveColor: context.forgroundColor,

                borderRadius: BorderRadius.circular(10),
                fieldHeight: 50,
                fieldWidth: MediaQuery.of(context).size.width/6,
                activeFillColor: context.backgroundColor,
                // hasError ? Colors.orange : Colors.white,
              ),
              cursorColor: context.forgroundColor,
              animationDuration: const Duration(milliseconds: 300),
              textStyle: const TextStyle(fontSize: 20, height: 1.6),
              backgroundColor: context.backgroundColor,

              enableActiveFill: false,

              controller: controller.pinCodeController,
              keyboardType: TextInputType.number,
              boxShadows: const [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Colors.black12,
                  blurRadius: 10,
                )
              ],
              onCompleted: (v) {
                log("Completed");
              },
              // onTap: () {
              //   print("Pressed");
              // },
              // onChanged: (value) {
              //   print(value);
              //   setState(() {
              //     currentText = value;
              //   });
              // },
            ),
          ]);
        },
      ),
    );
  }
}
