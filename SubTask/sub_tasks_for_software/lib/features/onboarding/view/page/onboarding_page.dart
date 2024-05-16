// import 'package:a/a.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frist_pages/features/onboarding/controller/cubit/onboarding_cotroller_cubit.dart';
import 'package:frist_pages/features/onboarding/view/component/onboarding_body.dart';
import 'package:frist_pages/features/onboarding/view/component/onboarding_button.dart';
// import 'package:frist_pages/core/utils/extension.dart';
// ignore: depend_on_referenced_packages
// import 'package:flutter_bloc/flutter_bloc.dart';




class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return(
       SafeArea(
        // backgroundColor: context.backgroundColor,
    
      child: BlocProvider<OnboardingCotrollerCubit>(
        create: (context) => OnboardingCotrollerCubit(),
        child: BlocBuilder<OnboardingCotrollerCubit, OnboardingCotrollerState>(
          builder: (context, state) {
            OnboardingCotrollerCubit controller = context.read<OnboardingCotrollerCubit>();
            return  Scaffold(
              // backgroundColor: context.backgroundColor,
              body: OnboardingBody( controller: controller,),
              bottomNavigationBar: OnboardingButtonWidget(controller:controller,),
            );
          },
        ),
      ),
    )
    );
  }
}
