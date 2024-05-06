import 'package:finance2_app/const/app_colors.dart';
import 'package:finance2_app/const/app_icons.dart';
import 'package:finance2_app/const/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          SizedBox(height: 30),
          Row(
            children: [
              Text(
                'Settings',
                style: onboardstyle,
              ),
            ],
          ),
          SizedBox(height: 30),
          Container(
            width: double.infinity,
            height: 108,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: primary),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Give us 5 star!',
                        style: onboardstyle.copyWith(
                            fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        'Your feedback helps us \nto improve',
                        style: discriptstyle.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/Images/SettingsImage.png',
                    height: 108,
                    width: 108,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: primary),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                            color: Color(0xffFFFFFF).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(child: SvgPicture.asset(terms))),
                    SizedBox(width: 15),
                    Text(
                      'Terms & Conditions',
                      style: discriptstyle.copyWith(color: Colors.white),
                    ),
                    Spacer(),
                    Icon(Icons.chevron_right, color: Colors.white)
                  ],
                ),
              )),
          SizedBox(height: 15),
          Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: primary),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                            color: Color(0xffFFFFFF).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(child: SvgPicture.asset(privacy))),
                    SizedBox(width: 15),
                    Text(
                      'Privacy Policy',
                      style: discriptstyle.copyWith(color: Colors.white),
                    ),
                    Spacer(),
                    Icon(Icons.chevron_right, color: Colors.white)
                  ],
                ),
              )),
          SizedBox(height: 15),
          Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: primary),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                            color: Color(0xffFFFFFF).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(child: SvgPicture.asset(support))),
                    SizedBox(width: 15),
                    Text(
                      'Support Page',
                      style: discriptstyle.copyWith(color: Colors.white),
                    ),
                    Spacer(),
                    Icon(Icons.chevron_right, color: Colors.white)
                  ],
                ),
              )),
          SizedBox(height: 15),
          Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: primary),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                            color: Color(0xffFFFFFF).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(child: SvgPicture.asset(rate))),
                    SizedBox(width: 15),
                    Text(
                      'Rate Us',
                      style: discriptstyle.copyWith(color: Colors.white),
                    ),
                    Spacer(),
                    Icon(Icons.chevron_right, color: Colors.white)
                  ],
                ),
              )),
          SizedBox(height: 15),
          Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: primary),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                            color: Color(0xffFFFFFF).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(child: SvgPicture.asset(share))),
                    SizedBox(width: 15),
                    Text(
                      'Share App',
                      style: discriptstyle.copyWith(color: Colors.white),
                    ),
                    Spacer(),
                    Icon(Icons.chevron_right, color: Colors.white)
                  ],
                ),
              )),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
