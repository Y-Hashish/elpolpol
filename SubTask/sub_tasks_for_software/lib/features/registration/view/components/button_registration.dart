import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frist_pages/core/utils/extension.dart';
import 'package:frist_pages/features/login/view/page/login_page.dart';
import 'package:frist_pages/features/registration/controller/cubit/registration_cubit.dart';

class ButtonRegistrationWidget extends StatelessWidget {
  const ButtonRegistrationWidget({super.key, required this.controller});
  final RegistrationCubit controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 30, 20),
      child: BlocProvider.value(
        value: controller,
        child: BlocBuilder<RegistrationCubit, RegistrationState>(
          builder: (context, state) {
            RegistrationCubit controller = context.read<RegistrationCubit>();
            return Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAroun,
              children: [
                SizedBox(
                  width: context.width - 40,
                  height: 45,
                  child: FilledButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(context.forgroundColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        )),
                    onPressed: () {
                      controller.onpressedConfirmButton(context);
                      // controller.onpressedConfirmButton,
                    },
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "aleady have an account? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {
                        {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (v) {
                            return  const LoginPage( firstName: ' ', lastName: '',);
                          }));
                        } 
                      },
                      child: Text(
                        'login',
                        style: TextStyle(
                          color: context.forgroundColor,
                          decorationThickness: 1,
                          decoration: TextDecoration.underline,
                          decorationColor: context.forgroundColor,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      ),
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
