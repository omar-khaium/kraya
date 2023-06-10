import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/text_style.dart';

class OtpTimer extends StatefulWidget {
  final int timerMaxSeconds;
  final Function(int) onFinish;

  const OtpTimer({super.key, this.timerMaxSeconds=60,required this.onFinish});

  @override
  _OtpTimerState createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  final interval = const Duration(seconds: 1);

  int currentSeconds = 0;

  String get timerText =>
      '${((widget.timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((widget.timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        currentSeconds = timer.tick;
        if (timer.tick >= widget.timerMaxSeconds) {
          timer.cancel();
          widget.onFinish(timer.tick);
        }
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.timer_outlined,
          color: ColorSystem.instance.hint,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(timerText,
            style: TextSystem.instance.small(
              ColorSystem.instance.hint,
            ))
      ],
    );
  }
}
