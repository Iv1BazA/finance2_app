import 'package:finance2_app/const/app_colors.dart';
import 'package:finance2_app/const/app_images.dart';
import 'package:finance2_app/const/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoardingWidget2 extends StatelessWidget {
  const OnBoardingWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            SizedBox(height: 45),
            SizedBox(height: 15),
            Image.asset(onboard2),
            SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xffF3F6FF)),
              ),
              SizedBox(width: 5),
              Container(
                width: 32,
                height: 12,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: primary),
              ),
            ]),
            SizedBox(height: 45),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Your cash flow is',
                    style: onboardstyle.copyWith(fontSize: 20)),
                Text(' under control',
                    style: onboardstyle.copyWith(fontSize: 20, color: primary)),
              ],
            ),
            SizedBox(height: 10),
            Text(
                'Keep track of your income with our convenient tools and plan your finances easily.',
                textAlign: TextAlign.center,
                style: onboardstyle.copyWith(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400)),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/main');
              },
              child: Container(
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    'Next',
                    style: buttonText,
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
