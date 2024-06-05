import 'dart:ui';

import 'package:cool_timer/counter/views/widgets/count_down_widget.dart';
import 'package:cool_timer/counter/views/widgets/floating_action_bottons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

import '../../../utils/constants/dimens.dart';

class CountdownPage extends StatefulWidget {
  const CountdownPage({Key? key}) : super(key: key);

  @override
  _CountdownPageState createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage>
    with TickerProviderStateMixin {
  late AnimationController controller;

  bool isPlaying = false;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${controller.duration!.inHours}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  void notify() {
    if (countText == '0:00:00') {
      FlutterRingtonePlayer()
          .playAlarm(volume: 2, looping: true, asAlarm: true);
    }
  }

  void showEditTimerModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: 300,
        child: CupertinoTimerPicker(
          initialTimerDuration: controller.duration!,
          onTimerDurationChanged: (time) {
            setState(() {
              controller.duration = time;
            });
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    );

    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButtons(
          isPlaying: isPlaying,
          controller: controller,
          onPlay: () {
            controller.reverse(
                from: controller.value == 0 ? 1.0 : controller.value);
            setState(() {
              isPlaying = true;
            });
          },
          onPause: () {
            controller.stop();
            setState(() {
              isPlaying = false;
            });
          },
          onEdit: () {
            showEditTimerModal();
          },
          onStop: () {
            controller.reset();
            setState(() {
              isPlaying = false;
            });
          }),
      //backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(Dimens.padding.normal),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isPlaying
                  ? "Keep grinding 💪🏽, We'll tell you when it's time to take a break and you get that well deserved rest😃 "
                  : "Ready to get back to grinding? Tap the ✏️  icon to set a duration, then tap the ▶️ to get started",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(
              height: Dimens.spacing.extremeSpacing,
            ),
            CountDownWidget(
                progress: progress,
                controller: controller,
                counterValue: countText,
                onTap: () {
                  showEditTimerModal();
                })
          ],
        ),
      ),
    );
  }
}
