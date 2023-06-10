import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/text_style.dart';


class TaskNotifier {
  static final TaskNotifier instance = TaskNotifier._private();

  TaskNotifier._private();

//------------------------------------------------------------------------------------------------------------------------------------------------------------------
  void success(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          padding: EdgeInsets.zero,
          content: ListTile(
            dense: true,
            horizontalTitleGap: 0,
            visualDensity: VisualDensity.compact,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: const Icon(Icons.check_circle_rounded, color: Colors.white),
            title: Text(
              message,
              style: TextSystem.instance.small(ColorSystem.instance.background),
            ),
          ),
          elevation: 4,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.greenAccent.shade700,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      );
  }

  void error(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          padding: EdgeInsets.zero,
          margin: MediaQuery.of(context).viewInsets,
          content: ListTile(
            dense: true,
            horizontalTitleGap: 0,
            visualDensity: VisualDensity.compact,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: const Icon(Icons.error_rounded, color: Colors.white),
            title: Text(
              message,
              style: TextSystem.instance.small(ColorSystem.instance.background),
            ),
          ),
          elevation: 4,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      );
  }

  void runningTicketError(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          padding: EdgeInsets.zero,
          margin: const EdgeInsets.only(bottom: 128, left: 16, right: 16),
          content: ListTile(
            dense: true,
            horizontalTitleGap: 0,
            visualDensity: VisualDensity.compact,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: const Icon(Icons.error_rounded, color: Colors.white),
            title: Text(
              message,
              style: TextSystem.instance.small(ColorSystem.instance.background),
            ),
          ),
          elevation: 4,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      );
  }

  void warning(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          padding: EdgeInsets.zero,
          content: ListTile(
            dense: true,
            horizontalTitleGap: 0,
            visualDensity: VisualDensity.compact,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: const Icon(Icons.warning_rounded, color: Colors.white),
            title: Text(
              message,
              style: TextSystem.instance.small(ColorSystem.instance.background),
            ),
          ),
          elevation: 4,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      );
  }

  void info(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          padding: EdgeInsets.zero,
          content: ListTile(
            dense: true,
            horizontalTitleGap: 0,
            visualDensity: VisualDensity.compact,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: const Icon(Icons.tips_and_updates_rounded, color: Colors.white),
            title: Text(
              message,
              style: TextSystem.instance.small(ColorSystem.instance.background),
            ),
          ),
          elevation: 4,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      );
  }
}
