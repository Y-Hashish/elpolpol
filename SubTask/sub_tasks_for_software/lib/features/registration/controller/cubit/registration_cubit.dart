import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void onpressedConfirmButton(BuildContext context) {
    print("${firstNameController.text}");
    print("${lastNameController.text}");
    if (formkey.currentState!.validate())
     {
      Navigator.pushNamed(context, 'LoginPage', arguments: [
        firstNameController.text,
        lastNameController.text,
      ]);

      log('invalid Input');
    }
  }
}
