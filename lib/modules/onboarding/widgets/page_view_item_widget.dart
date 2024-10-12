import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hup/core/utils/app_strings.dart';
import 'package:fruits_hup/core/utils/app_text_styles.dart';

class PageViewItemWidget extends StatelessWidget {
  const PageViewItemWidget({
    super.key,
    required this.image,
    required this.backGroundImage,
    required this.subTitleImage,
    required this.titleImage,
    required this.isVisible,
    this.onPress,
  });
  final String image, backGroundImage;
  final String subTitleImage;
  final String titleImage;
  final bool isVisible;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backGroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(
                  image,
                ),
              ),
              Visibility(
                visible: isVisible,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: InkWell(
                    onTap: onPress,
                    child: Text(
                      AppStrings.onboardingSkipText,
                      style: AppTextStyle.Cairo400style13,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 47.5),
        SvgPicture.asset(titleImage),
        SizedBox(height: 24),
        SvgPicture.asset(subTitleImage),
      ],
    );
  }
}
