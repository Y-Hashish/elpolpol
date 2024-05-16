import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frist_pages/features/onboarding/controller/cubit/onboarding_cotroller_cubit.dart';

// ignore: must_be_immutable
class OnboardingButtonWidget extends StatelessWidget {
  OnboardingButtonWidget({super.key, required this.controller});
  OnboardingCotrollerCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingCotrollerCubit>.value(
      value: controller,
      // create: (context) => OnboardingCotrollerCubit(),
      child: BlocBuilder<OnboardingCotrollerCubit, OnboardingCotrollerState>(
        builder: (context, state) {
          OnboardingCotrollerCubit controller =
              context.read<OnboardingCotrollerCubit>();
          return SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      controller.onCallSkip(context);
                    },
                    child: const Text('skip')),
                TextButton(
                  onPressed: () {
                    controller.onChangeToNext(context);
                  },
                  child: const Text('next'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
