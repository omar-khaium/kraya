import 'package:flutter/material.dart';
import 'package:kraya/core/text_style.dart';

import '../ui/widgets/singleton_task_notifier.dart';

extension BuildContextExtension on BuildContext {
  //?---------------------Core---------------------//
  double get width {
    return MediaQuery.of(this).size.width;
  }

  double get height {
    return MediaQuery.of(this).size.height;
  }

  double get statusBarHeight {
    return MediaQuery.of(this).padding.top;
  }

  double get navigationHeight {
    return MediaQuery.of(this).padding.bottom;
  }

  //?---------------------Core---------------------//
  //*-----------------Notification-----------------//

  void errorNotificationMessage(String message) {
    TaskNotifier.instance.error(this, message: message);
  }

  void successNotification(String message) {
    TaskNotifier.instance.success(this, message: message);
  }

  void infoNotification(String message) {
    TaskNotifier.instance.info(this, message: message);
  }

  void warningNotification(String message) {
    TaskNotifier.instance.warning(this, message: message);
  }


  //*------------------Text Style------------------//
  TextStyle headline({Color? color}) {
    return TextSystem.instance.veryLarge(color!);
  }

  TextStyle caption({Color? color}) {
    return TextSystem.instance.small(color!);
  }

  TextStyle subtitleTextStyle({Color? color}) {
    return TextSystem.instance.large(color!);
  }
//*------------------Text Style------------------//
}
