import 'package:flutter/material.dart';

import '../../../utils/constants/dimens.dart';

class FloatingActionButtons extends StatelessWidget {
  const FloatingActionButtons(
      {super.key,
      required this.isPlaying,
      required this.onPlay,
      required this.onPause,
      required this.onEdit,
      required this.onStop,
      required this.controller});

  final AnimationController controller;
  final bool isPlaying;
  final Function() onPlay;
  final Function() onPause;
  final Function() onEdit;
  final Function() onStop;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
            onPressed: (controller.isAnimating) ? onPause : onPlay,
            child: Icon(
              isPlaying == true ? Icons.pause : Icons.play_arrow,
            )),
        SizedBox(
          height: Dimens.spacing.normal,
        ),
        FloatingActionButton(
            onPressed: isPlaying ? onStop : onEdit,
            child: Icon(
              isPlaying == true ? Icons.stop : Icons.edit,
            )),
      ],
    );
  }
}
