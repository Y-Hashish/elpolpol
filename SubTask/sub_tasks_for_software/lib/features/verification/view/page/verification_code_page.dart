import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frist_pages/core/utils/extension.dart';
import 'package:frist_pages/features/verification/controller/cubit/verification_cubit.dart';
import 'package:frist_pages/features/verification/view/components/button_verification.dart';
import 'package:frist_pages/features/verification/view/components/verification_widget.dart';


class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 41, 126),
        title: const Text(" "),
      ),
      body: BlocProvider(
        create: (context) => VerificationCubit(),
        child: BlocBuilder<VerificationCubit, VerificationState>(
          builder: (context, state) {
            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/images/logo.jpg",
                      height: 200,
                    ),
                    const Expanded(
                      child: VerificationWidget(),
                    ),
                    const SizedBox(
                      height: 100,
                      child: ButtonVerificationWidget(),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
