import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../inter_text.dart';

sealed class AppSnackBar {
  static final snackbarKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackbar(String text) {
    final messenger = snackbarKey.currentState;
    messenger?.removeCurrentSnackBar();
    messenger?.hideCurrentSnackBar();
    messenger?.showSnackBar(
      SnackBar(
        content: InterText(
          text,
          size: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),
        backgroundColor: AppColors.primaryBlue,
      ),
    );
  }

  static void showErrorSnackBar([String? text]) {
    text ??= 'Something went wrong. Please try again.';
    debugPrint("Snakbar message $text");
    final messenger = snackbarKey.currentState;
    messenger?.removeCurrentSnackBar();
    messenger?.hideCurrentSnackBar();
    messenger?.showSnackBar(
      SnackBar(
        content: InterText(
          text,
          size: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.white,
        ),
        backgroundColor: AppColors.red,
      ),
    );
  }

// static void showSnackbarForContext(BuildContext context, String text) {
//   // final messenger = snackbarKey.currentState;
//   // messenger?.removeCurrentSnackBar();
//   // messenger?.hideCurrentSnackBar();
//   ScaffoldMessenger.of(context).removeCurrentSnackBar();
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: NotoSansText(text, color: AppColors.white),
//       backgroundColor: AppColors.primary,
//     ),
//   );
// }
}

$showSnackBar({
  required BuildContext context,
  required String message,
  IconData icon = Icons.close_rounded,
  required Color backColor,
  Color contentTextColor = AppColors.white,
}) {
  final messenger = ScaffoldMessenger.of(context);
  messenger
      .showSnackBar(customSnackbar(message, icon, backColor, contentTextColor));
}

SnackBar customSnackbar(
    String content, IconData icon, Color backColor, Color contentTextColor) {
  return SnackBar(
    elevation: 0,
    content: Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.white,
          child: Icon(
            icon,
            color: const Color(0xff4B5563),
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: InterText(
            content,
            color: contentTextColor,
            size: 16,
          ),
        ),
      ],
    ),
    backgroundColor: backColor,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
  );
}
