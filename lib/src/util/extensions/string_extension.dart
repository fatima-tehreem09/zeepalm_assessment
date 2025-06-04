import 'package:fluttertoast/fluttertoast.dart';

import '../../const/colors.dart';

extension StringHelper on String? {
  bool get isValidUrl {
    return Uri.parse(this!).isAbsolute;
  }

  String get capitalize {
    return "${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}";
  }

  bool get isValidUrlAndNotNull {
    return isValidUrl && this != null && this!.isNotEmpty;
  }

  Future<bool?> showToast(ToastType toastType) {
    return Fluttertoast.showToast(
      msg: "$this",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: _getColorByToastType(toastType),
      textColor: AppColors.primaryBlue,
      fontSize: 16.0,
    );
  }

  _getColorByToastType(ToastType toastType) {
    switch (toastType) {
      case ToastType.error:
        return AppColors.red;
      case ToastType.success:
        return AppColors.lightBlack;
      case ToastType.log:
        return AppColors.hintDarkGrey;
    }
  }
}

enum ToastType { error, success, log }
