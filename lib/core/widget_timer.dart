import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/text_style.dart';

class OtpTimer extends StatefulWidget {
  final int timerMaxSeconds;

  const OtpTimer({super.key, required this.timerMaxSeconds});

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
        if (kDebugMode) {
          print(timer.tick);
        }
        currentSeconds = timer.tick;
        if (timer.tick >= widget.timerMaxSeconds) timer.cancel();
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
      children: <Widget>[
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
