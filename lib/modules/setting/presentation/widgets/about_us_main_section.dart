import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import 'custom_contact_row_widget.dart';

class AboutMeMainSection extends StatelessWidget {
  const AboutMeMainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "نبذة عني",
          style: AppTextStyle.Cairo400style16.copyWith(
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          "أنا كرم سلامة، مطوّر تطبيقات موبايل باستخدام Flutter. أتمتع بشغف كبير لتصميم وتطوير تطبيقات عالية الجودة تهدف إلى تحسين تجربة المستخدم وتقديم حلول رقمية فعالة بواجهة بسيطة وأداء سلس.",
          style: AppTextStyle.Cairo400style16,
        ),
        const SizedBox(height: 24),
        Text(
          "الخبرات والمشروعات",
          style: AppTextStyle.Cairo400style16.copyWith(
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          """
  خلال مسيرتي كمطور، عملت على عدة تطبيقات متنوعة مثل HealHive، وهو تطبيق طبي لمتابعة المرضى وحجز المواعيد، وNewsCloud الذي يقدم الأخبار من مصادر متعددة مع تصنيف حسب الفئات، بالإضافة إلى TODO App لإدارة المهام اليومية باستخدام SQLite، وMovir لحجز تذاكر السينما مع اختيار المقاعد والدفع الإلكتروني، وأخيرًا FoodFDay الذي يساعد المستخدمين على تخطيط وجباتهم الأسبوعية بطريقة منظمة وجذابة.كما التحقت بتدريب عملي لمدة 6 شهور كـ Mobile Application Developer ضمن منحة DEPI التابعة لوزارة الاتصالات، حيث ساعدني ذلك في تعزيز مهاراتي العملية واكتساب خبرة في العمل ضمن فريق واستخدام أدوات وتقنيات حديثة في تطوير التطبيقات.
  """,
          style: AppTextStyle.Cairo400style16,
        ),
        Text(
          "معلومات التواصل",
          style: AppTextStyle.Cairo400style16.copyWith(
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        CustomContactRowWidget(
          onTap: () async {
            final Uri emailLaunchUri = Uri(
              scheme: 'mailto',
              path: 'karamsalama2024@gmail.com',
              queryParameters: {
                'subject': 'Contact From FruitsHup App',
                'body': 'Hello Karam,',
              },
            );

            final bool launched = await launchUrl(
              emailLaunchUri,
              mode: LaunchMode.externalApplication,
            );

            if (!launched) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Could not open email client.')),
              );
            }
          },
          title: "عبر الايميل",
          icon: Icons.email,
        ),
        Divider(color: AppColors.lighterGrey),
        CustomContactRowWidget(
          onTap: () async {
            final Uri whatsappUri = Uri(
              scheme: 'https',
              path: 'wa.me/201027547215',
            );
            if (await canLaunchUrl(whatsappUri)) {
              await launchUrl(whatsappUri);
            } else {
              throw 'Could not launch WhatsApp';
            }
          },
          title: "عبر الواتساب",
          icon: Icons.phone_android_outlined,
        ),
        Divider(color: AppColors.lighterGrey),
        CustomContactRowWidget(
          onTap: () async {
            final Uri linkedinUri = Uri(
              scheme: 'https',
              path: 'www.linkedin.com/in/karam-salama/',
            );
            if (await canLaunchUrl(linkedinUri)) {
              await launchUrl(linkedinUri);
            } else {
              throw 'Could not launch LinkedIn';
            }
          },
          title: "عبر لينكدان",
          child: Image.asset(
            Assets.assetsIconslinkedinImage,
            width: 20,
            height: 20,
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
