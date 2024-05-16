import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frist_pages/core/utils/extension.dart';
import 'package:frist_pages/core/utils/validation.dart';
import 'package:frist_pages/features/registration/controller/cubit/registration_cubit.dart';
import 'package:frist_pages/features/registration/view/components/age_formater.dart';

// import 'package:frist_pages/features/auth/registration/controller/cubit/registration_cubit.dart';

// ignore: must_be_immutable
class RegistrationDataWidget extends StatelessWidget {
  const RegistrationDataWidget({super.key,required this.controller});
  final RegistrationCubit controller;

  @override
  Widget build(BuildContext context) {
         return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 30, 20),
      child: BlocProvider.value(
        value: controller ,
        child: BlocBuilder <RegistrationCubit,RegistrationState> (
          builder: (context, state){
            RegistrationCubit controller = context.read<RegistrationCubit>();
            return 
            Column(
              
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Create a New Account',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: context.forgroundColor,
                      )),

                  const SizedBox(height: 25),
                  // const Spacer(flex:6),

                  // const Text("First Name ",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 17, fontWeight: FontWeight.bold,  ),),

                  
             Form(
              key:controller.formkey,
              child: Column(
              
              children: [
                 /// First Name
                  TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller.firstNameController,
                      keyboardType: TextInputType.name,
                      validator: MyValidation().nameValidate,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp( r'[A-Z]?[a-z]?'),),
                      ],
                      decoration: decoration.copyWith(
                        labelText: "First Name",
                        prefixIcon: Icon(
                          Icons.person,
                          color: context.forgroundColor,
                        ),
                      )),

                const SizedBox(height: 10),

                  ///Last Name

                  // const Text("Last Name ",style: TextStyle(color: Color.fromARGB(246, 255, 255, 255), fontSize: 17, fontWeight: FontWeight.bold, )),

                  TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller.lastNameController,
                      keyboardType: TextInputType.name,
                      validator: MyValidation().nameValidate,
                      decoration: decoration.copyWith(
                        labelText: "Last Name",
                        prefixIcon: Icon(
                          Icons.person,
                          color: context.forgroundColor,
                        ),
                      )),

                const SizedBox(height: 10),
                  ///Mail
                  // const Text("Email ",style: TextStyle(color:Color.fromARGB(246, 255, 255, 255), fontSize: 17, fontWeight: FontWeight.bold, )),
                  TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller.mailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: MyValidation().emailValidate,
                      decoration: decoration.copyWith(
                        labelText: "Email Adrress",
                        prefixIcon: Icon(
                          Icons.mail,
                          color: context.forgroundColor,
                        ),
                      )),

                const SizedBox(height: 10),

                  ///Password
                  // const Text("Password ",style: TextStyle(color: Color.fromARGB(246, 255, 255, 255), fontSize: 17, fontWeight: FontWeight.bold, )),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    controller: controller.passwordController,
                    // keyboardType: TextInputType.visiblePassword,
                    validator: MyValidation().passwordValidate,
                    decoration: decoration.copyWith(
                      labelText: "Password",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: context.forgroundColor,
                      ),
                      suffixIcon: Icon(
                        CupertinoIcons.eye_slash,
                        color: context.forgroundColor,
                      ),
                    ),
                    obscureText: true,
                  )
                  ])
                  ),
                ]);
          },
        ),
      ),
    );
  }
}

InputDecoration decoration = InputDecoration(
    fillColor: const Color.fromARGB(250, 230, 245, 255),
    filled: true,
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey, width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff14238A), width: 2),
      // borderRadius: BorderRadius.circular(10);
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2),

      // borderRadius: BorderRadius.circular(50)
    ));
