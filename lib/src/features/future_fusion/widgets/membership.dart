import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zeepalm_assessment/src/const/colors.dart';
import 'package:zeepalm_assessment/src/features/future_fusion/widgets/comments.dart';
import 'package:zeepalm_assessment/src/features/future_fusion/widgets/current_membership.dart';
import 'package:zeepalm_assessment/src/features/future_fusion/widgets/save_block.dart';
import 'package:zeepalm_assessment/src/util/extensions/size_extension.dart';
import 'package:zeepalm_assessment/src/widgets/montaserat_text.dart';
import 'package:zeepalm_assessment/src/widgets/parent_container.dart';

class Membership extends ConsumerWidget {
  const Membership({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(17.13),
      margin: const EdgeInsets.symmetric(horizontal: 13),
      decoration: const BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            color: AppColors.borderColor,
            width: 1.07,
          ),
        ),
      ),
      child: CustomScrollView(
        slivers: [
          Montserrat(
            "Choose Your Membership",
            size: 19.27,
            fontWeight: FontWeight.w600,
            color: AppColors.titleBlue,
          ).sliver,
          8.56.sliverHeight,
          Montserrat(
            "Select the membership tier that best fits your lifestyle and interests.",
            size: 17.13,
            color: AppColors.bodyGrey,
          ).sliver,
          25.69.sliverHeight,
          ParentContainer(
            padding: const EdgeInsets.all(18.2),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Montserrat(
                        "Current Plan: Basic",
                        size: 14.99,
                        color: AppColors.titleBlue,
                      ),
                      Montserrat(
                        "Valid until: December 31, 2023",
                        size: 12.85,
                        color: AppColors.bodyGrey,
                      ),
                    ],
                  ),
                ),
                ParentContainer(
                  opacity: 0.1,
                  radius: 100,
                  showBorder: false,
                  child: Montserrat(
                    "Active",
                    size: 12.85,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryPink,
                  ),
                ),
              ],
            ),
          ).sliver,
          25.69.sliverHeight,
          const CurrentMembership(
            isPopular: false,
          ).sliver,
          17.41.sliverHeight,
          const CurrentMembership(
            isPopular: true,
          ).sliver,
          17.41.sliverHeight,
          const CurrentMembership(
            isPremier: true,
          ).sliver,
          17.41.sliverHeight,
          SaveBlock().sliver,
          24.91.sliverHeight,
          Montserrat(
            "What Our Members Say",
            size: 19.27,
            color: AppColors.titleBlue,
            fontWeight: FontWeight.w600,
          ).sliver,
          17.13.sliverHeight,
          Comments(),
        ],
      ),
    );
  }
}
