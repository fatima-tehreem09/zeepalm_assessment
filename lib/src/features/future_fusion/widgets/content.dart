import 'package:flutter/material.dart';
import 'package:zeepalm_assessment/src/features/future_fusion/widgets/article_list.dart';
import 'package:zeepalm_assessment/src/util/extensions/size_extension.dart';
import 'package:zeepalm_assessment/src/widgets/primary_button.dart';

import '../../../const/colors.dart';
import '../../../widgets/montaserat_text.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: CustomScrollView(
        slivers: [
          Montserrat(
            "Featured Articles",
            size: 19.11,
            fontWeight: FontWeight.w600,
          ).sliver,
          8.49.sliverHeight,
          Montserrat(
            "Explore insights, stories, and perspectives from our community.",
            size: 16.99,
            color: AppColors.bodyGrey,
          ).sliver,
          25.48.sliverHeight,
          const ArticleList(),
          25.48.sliverHeight,
          AppButton(
            maximumSize: const Size(180, 41),
            side: const BorderSide(
              color: AppColors.primaryPink,
            ),
            borderRadius: BorderRadius.circular(8.49),
            onPressed: () {},
            text: "Load More Articles",
          ).sliver,
          25.48.sliverHeight,
        ],
      ),
    );
  }
}
