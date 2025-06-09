import 'package:flutter/material.dart';
import 'package:zeepalm_assessment/src/const/colors.dart';
import 'package:zeepalm_assessment/src/util/extensions/size_extension.dart';
import 'package:zeepalm_assessment/src/widgets/montaserat_text.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.title = "",
    this.shouldShowLeading = false,
    this.onTap,
    this.actionWidget = const SizedBox.shrink(),
    this.leadingIcon = "",
  });

  final String title;
  final bool shouldShowLeading;
  final void Function()? onTap;
  final String leadingIcon;
  final Widget actionWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      scrolledUnderElevation: 0.0,
      leading: !shouldShowLeading ? null : const Icon(Icons.arrow_back_ios),
      centerTitle: !shouldShowLeading ? false : true,
      title: Montserrat(
        title,
        fontWeight: FontWeight.w600,
        size: 21.41,
        color: AppColors.bigBlue,
      ),
      actions: [
        actionWidget,
        30.13.width,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
