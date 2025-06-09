import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeepalm_assessment/src/const/assets.dart';
import 'package:zeepalm_assessment/src/const/colors.dart';
import 'package:zeepalm_assessment/src/features/future_fusion/widgets/rich_text.dart';
import 'package:zeepalm_assessment/src/util/extensions/size_extension.dart';
import 'package:zeepalm_assessment/src/widgets/montaserat_text.dart';
import 'package:zeepalm_assessment/src/widgets/parent_container.dart';
import 'package:zeepalm_assessment/src/widgets/primary_button.dart';

class CurrentMembership extends StatelessWidget {
  const CurrentMembership({
    super.key,
    this.isPopular = false,
    this.isPremier = false,
  });

  final bool isPopular;
  final bool isPremier;

  @override
  Widget build(BuildContext context) {
    final List<String> popularStuff = [
      'All Basic benefits',
      'Priority access to limited-capacity events',
      'Exclusive Premium-only events',
      'Join unlimited interest groups',
    ];
    final List<String> basicStuff = [
      'Access to public events',
      'Basic member directory access',
      'Join up to 3 interest groups',
    ];
    final List<String> premium = [
      'All Premium benefits',
      'Personal concierge service',
      'Complimentary guest passes',
      'VIP-only exclusive experiences',
      'Partner benefits & discounts',
    ];
    return ParentContainer(
      padding:
          EdgeInsets.fromLTRB(0, isPopular || isPremier ? 0 : 17.13, 0, 17.13),
      fillColor: Colors.white,
      showOpacity: false,
      shadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.5),
          blurRadius: 2.14,
          blurStyle: BlurStyle.outer,
          offset: const Offset(0, 1.07),
        ),
      ],
      borderColor: AppColors.borderColor,
      child: Column(
        children: [
          if (isPopular)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.85, vertical: 4.28),
              decoration: const BoxDecoration(
                color: AppColors.primaryPink,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.56),
                  bottomLeft: Radius.circular(8.56),
                ),
              ),
              child: Montserrat(
                "POPULAR",
                size: 12.85,
                color: AppColors.primaryWhite,
                fontWeight: FontWeight.w700,
              ),
            ).rightAlignment,
          Container(
            color: isPremier ? AppColors.primaryPink : Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isPremier) 17.13.height,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Montserrat(
                      isPremier
                          ? "Premier Membership"
                          : isPopular
                              ? "Basic Membership"
                              : "Basic",
                      size: 19.27,
                      fontWeight: FontWeight.w600,
                      color: isPremier
                          ? AppColors.primaryWhite
                          : AppColors.titleBlue,
                    ),
                    if (!isPopular) ...[
                      const Spacer(),
                      ParentContainer(
                        opacity: 0.1,
                        radius: 100,
                        showBorder: false,
                        child: Montserrat(
                          "Current",
                          size: 12.85,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryPink,
                        ),
                      ),
                    ],
                  ],
                ),
                8.56.height,
                RichTextWidget(
                  isWhite: isPremier,
                  text1: isPopular ? "\$45.00 " : "\$15.00 ",
                  text2: "/month",
                ),
                8.16.height,
                Montserrat(
                  isPremier
                      ? "The ultimate Parlor experience with personalized concierge service."
                      : isPopular
                          ? "Enhanced access to exclusive events and networking opportunities."
                          : "Perfect for those just starting to explore our community.",
                  size: 14.99,
                  color:
                      isPremier ? AppColors.primaryWhite : AppColors.bodyGrey,
                ),
                18.2.height,
              ],
            ).withHorizontalPadding(17.13),
          ),
          const Divider(
            height: 0,
            color: AppColors.borderColor,
          ),
          17.13.height,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isPopular) ...[
                ...List.generate(
                  popularStuff.length,
                  (index) => _Benifits(
                    data: popularStuff[index],
                  ),
                ),
              ] else if (isPremier)
                ...List.generate(
                  premium.length,
                  (index) => _Benifits(
                    data: premium[index],
                  ),
                )
              else
                ...List.generate(
                  basicStuff.length,
                  (index) => _Benifits(
                    data: basicStuff[index],
                  ),
                ),
              17.13.height,
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      isTransparent: true,
                      text: "View Details",
                      onPressed: () {},
                    ),
                  ),
                  12.85.width,
                  Expanded(
                    child: AppButton(
                      text: isPopular || isPremier ? "Upgrade" : "Current Plan",
                      onPressed: () {},
                    ),
                  ),
                ],
              )
            ],
          ).withHorizontalPadding(17.13),
        ],
      ),
    );
  }
}

class _Benifits extends StatelessWidget {
  const _Benifits({
    super.key,
    required this.data,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(AppAssets.tick),
        8.56.width,
        Expanded(
          child: Montserrat(
            data,
            color: AppColors.bodyGrey,
            height: 2,
          ),
        ),
      ],
    );
  }
}
