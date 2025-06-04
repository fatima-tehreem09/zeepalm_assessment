import 'package:flutter/material.dart';
import 'package:zeepalm_assessment/src/widgets/inter_text.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.title = "",
    this.shouldShowLeading = false,
    this.onTap,
    this.leadingIcon = "",
  });
  final String title;
  final bool shouldShowLeading;
  final void Function()? onTap;
  final String leadingIcon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      scrolledUnderElevation: 0.0,
      leading: !shouldShowLeading ? null : const Icon(Icons.arrow_back_ios),
      centerTitle: true,
      title: InterText(
        title,
        fontWeight: FontWeight.w500,
        size: 16,
      ),
      actions: [
        if (title.isEmpty) ...[
          Row(
            children: [
              GestureDetector(
                onTap: onTap,
                child: const Icon(Icons.logout_rounded),
              ),
            ],
          ),
        ],
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
