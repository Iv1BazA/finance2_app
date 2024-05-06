import 'package:finance2_app/const/app_colors.dart';
import 'package:finance2_app/const/app_images.dart';
import 'package:finance2_app/const/app_styles.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizStartWidget extends StatelessWidget {
  const QuizStartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Row(
            children: [
              Text(
                'Quiz',
                style: onboardstyle,
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 8),
          Container(width: 267, height: 277, child: Image.asset(quizstart)),
          Text(
            'Check how much you know \nabout finance',
            style: discriptstyle.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Image.asset(
            'assets/Images/divider.png',
            height: 112,
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/quiz');
            },
            child: Container(
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'Start',
                  style: buttonText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
