import 'package:flutter/material.dart';
import 'package:zeepalm_assessment/src/const/colors.dart';
import 'package:zeepalm_assessment/src/models/testimonial.dart';
import 'package:zeepalm_assessment/src/util/extensions/size_extension.dart';
import 'package:zeepalm_assessment/src/widgets/cached_image.dart';
import 'package:zeepalm_assessment/src/widgets/montaserat_text.dart';
import 'package:zeepalm_assessment/src/widgets/parent_container.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: testimonials.length,
      itemBuilder: (ctx, index) {
        final data = testimonials[index];
        return ParentContainer(
          padding: EdgeInsets.all(18.2),
          fillColor: Colors.white,
          borderColor: AppColors.borderColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CachedImageWidget(
                    size: 42.82,
                    fit: BoxFit.cover,
                    url: data.imageUrl,
                  ),
                  12.85.width,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Montserrat(
                          data.name,
                          color: AppColors.titleBlue,
                        ),
                        Montserrat(
                          "${data.membership} · ${data.timeFrame}",
                          size: 12.85,
                          color: AppColors.lightText,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              14.26.height,
              Montserrat(
                color: AppColors.bodyGrey,
                '"${data.testimonial}"',
                textAlign: TextAlign.start,
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => 17.13.height,
    );
  }
}
