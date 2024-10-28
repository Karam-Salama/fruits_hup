import 'dart:async'; // For the Timer

import 'package:flutter/material.dart';
import 'package:fruits_hup/core/utils/app_colors.dart';

import '../utils/app_assets.dart';

class CustomHomeBannerWidget extends StatefulWidget {
  const CustomHomeBannerWidget({
    super.key,
    this.onpress,
  });
  final VoidCallback? onpress;

  @override
  _CustomHomeBannerWidgetState createState() => _CustomHomeBannerWidgetState();
}

class _CustomHomeBannerWidgetState extends State<CustomHomeBannerWidget> {
  final List<String> bannerImages = [
    Assets.assetsImagesImageBanner1,
    Assets.assetsImagesImageBanner2,
    Assets.assetsImagesImageBanner3,
    Assets.assetsImagesImageBanner4,
    Assets.assetsImagesImageBanner5,
  ];

  late PageController pageController;
  int currentPage = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPage);

    timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (currentPage < bannerImages.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 158,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColors.blackColor,
          boxShadow: [
            BoxShadow(
              color: Color(0x0A000000),
              spreadRadius: 2,
              blurRadius: 9,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: PageView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: bannerImages.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      bannerImages[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    right: -15,
                    bottom: 0,
                    child: InkWell(
                      onTap: widget.onpress,
                      child: Image.asset(
                        Assets.assetsIconsHappyEidSales,
                        height: 158,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
