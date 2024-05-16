

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(VerificationInitial());
  TextEditingController pinCodeController = TextEditingController();


  
  
}
