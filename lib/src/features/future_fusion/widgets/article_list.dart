import 'package:flutter/material.dart';
import 'package:zeepalm_assessment/src/models/articles.dart';
import 'package:zeepalm_assessment/src/util/extensions/size_extension.dart';
import 'package:zeepalm_assessment/src/widgets/primary_button.dart';

import '../../../const/colors.dart';
import '../../../widgets/cached_image.dart';
import '../../../widgets/montaserat_text.dart';
import '../../../widgets/parent_container.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: articles.length,
      itemBuilder: (ctx, index) {
        final data = articles[index];
        return ParentContainer(
          shadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 2.14,
              blurStyle: BlurStyle.outer,
              offset: const Offset(0, 1.07),
            ),
          ],
          padding: const EdgeInsets.only(bottom: 16.99),
          fillColor: Colors.white,
          borderColor: AppColors.borderColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  CachedImageWidget(
                    url: data.imageUrl,
                    size: 203.86,
                    radius: const BorderRadius.only(
                      topRight: Radius.circular(8.56),
                      topLeft: Radius.circular(8.56),
                    ),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Positioned(
                    top: 7,
                    right: 7,
                    child: ParentContainer(
                      radius: 4.25,
                      showOpacity: false,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.49, vertical: 4.25),
                      fillColor: AppColors.primaryPink,
                      showBorder: false,
                      child: Montserrat(
                        data.tag,
                        size: 12.74,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryWhite,
                      ),
                    ),
                  ),
                ],
              ),
              16.99.height,
              Column(
                children: [
                  Montserrat(
                    data.title,
                    size: 19.11,
                    fontWeight: FontWeight.w600,
                  ),
                  4.25.height,
                  Montserrat(
                    data.statement,
                    size: 14.86,
                    color: AppColors.bodyGrey,
                  ),
                  4.25.height,
                  Row(
                    children: [
                      CachedImageWidget(
                        size: 25.48,
                        fit: BoxFit.cover,
                        url: data.writerImage,
                      ),
                      8.49.width,
                      Expanded(
                        child: Montserrat(
                          data.writerName,
                          size: 12.74,
                          color: AppColors.lightText,
                        ),
                      ),
                      Montserrat(
                        data.date,
                        size: 12.74,
                        color: AppColors.lightText,
                      ),
                    ],
                  ),
                  21.23.height,
                  AppButton(
                    onPressed: () {},
                    text: "Read Article",
                  ),
                ],
              ).withHorizontalPadding(16.99),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => 25.48.height,
    );
  }
}
