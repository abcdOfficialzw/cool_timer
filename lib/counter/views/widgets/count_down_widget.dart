import 'package:flutter/material.dart';

class CountDownWidget extends StatelessWidget {
  const CountDownWidget(
      {super.key,
      required this.progress,
      required this.controller,
      required this.counterValue,
      required this.onTap});
  final double progress;
  final AnimationController controller;
  final String counterValue;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 300,
          child: CircularProgressIndicator(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            value: progress,
            strokeWidth: 1,
          ),
        ),
        GestureDetector(
          onTap: controller.isDismissed ? onTap : null,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) => Text(
              counterValue,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 60,
                  fontWeight: FontWeight.w200,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
      ],
    );
  }
}
