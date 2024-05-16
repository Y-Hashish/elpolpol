import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frist_pages/features/onboarding/controller/cubit/onboarding_cotroller_cubit.dart';

// ignore: must_be_immutable
class OnboardingBody extends StatelessWidget {
  OnboardingBody({super.key,required this.controller});
  OnboardingCotrollerCubit controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Welcome to our App"),
        Expanded(
          child: BlocProvider<OnboardingCotrollerCubit>.value(
            value: controller,
            // create: (context) => OnboardingCotrollerCubit(),
            child:
                BlocBuilder<OnboardingCotrollerCubit, OnboardingCotrollerState>(
              builder: (context, state) {
                OnboardingCotrollerCubit controller =
                    context.read<OnboardingCotrollerCubit>();
                return PageView(
                    controller: controller.pageController ,
                    onPageChanged: controller.onChangePage,
                    children: List.generate(controller.data.length, (index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(controller.data[index].image),
                      Text(
                        controller.data[index].title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: controller.data[index].color,
                        ),
                      ),
                      Text(
                        controller.data[index].subtitle,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                }));
              },
            ),
          ),
        )
      ],
    );
  }
}
