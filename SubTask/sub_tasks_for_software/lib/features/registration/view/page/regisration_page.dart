import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frist_pages/core/utils/extension.dart';
import 'package:frist_pages/features/registration/controller/cubit/registration_cubit.dart';
import 'package:frist_pages/features/registration/view/components/button_registration.dart';
import 'package:frist_pages/features/registration/view/components/regisration_data_widget.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationCubit>(
      create: (context) => RegistrationCubit(),
      child: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
          final RegistrationCubit controller =
              context.read<RegistrationCubit>();
          return Scaffold(
            backgroundColor: context.backgroundColor,
            appBar: AppBar(
              toolbarHeight: 50,
              backgroundColor: const Color.fromARGB(255, 28, 41, 126),
              title: const Text(" "),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.jpg",
                    height: 130,
                  ),

                
                      RegistrationDataWidget(controller: controller,
                    
                   ),
              
                      ButtonRegistrationWidget(
                    controller: controller,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
