import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeepalm_assessment/src/const/assets.dart';
import 'package:zeepalm_assessment/src/const/colors.dart';
import 'package:zeepalm_assessment/src/util/extensions/size_extension.dart';
import 'package:zeepalm_assessment/src/widgets/montaserat_text.dart';
import 'package:zeepalm_assessment/src/widgets/parent_container.dart';
import 'package:zeepalm_assessment/src/widgets/primary_button.dart';

class SaveBlock extends StatelessWidget {
  const SaveBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return ParentContainer(
      padding: EdgeInsets.all(18.2),
      child: Row(
        children: [
          Container(
            width: 38.54,
            height: 38.54,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryPink,
            ),
            child: SvgPicture.asset(
              AppAssets.timer,
              fit: BoxFit.scaleDown,
            ),
          ),
          12.85.width,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Montserrat(
                  "Save 20% with annual billing",
                  color: AppColors.titleBlue,
                ),
                2.14.height,
                Montserrat(
                  "Switch to annual billing and get 2 months free.",
                  size: 12.85,
                  color: AppColors.bodyGrey,
                ),
              ],
            ),
          ),
          Expanded(
            // flex: 3,
            child: AppButton(
              showOpacity: false,
              textSize: 12,
              padding: EdgeInsets.symmetric(horizontal: 4),
              onPressed: () {},
              text: "View Annual Plans",
              textColor: Color(0xffFFB6C1),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ],
      ),
    );
  }
}
