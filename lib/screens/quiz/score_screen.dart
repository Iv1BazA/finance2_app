import 'package:finance2_app/const/app_colors.dart';
import 'package:finance2_app/const/app_styles.dart';
import 'package:finance2_app/const/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScoreScreenWidget extends StatelessWidget {
  int score;
  ScoreScreenWidget({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    String text = '';
    String image = '';
    String getResultText(int score) {
      if (score >= 0 && score <= 8) {
        return "You'll definitely make it next time";
      } else if (score >= 8 && score <= 14) {
        return "You have a good grasp of the basics!";
      } else {
        return "You have successfully answered all the questions, way to go!";
      }
    }

    String getResulImage(int score) {
      if (score >= 0 && score <= 8) {
        return 'assets/Images/zero.png';
      } else if (score >= 8 && score <= 14) {
        return 'assets/Images/one.png';
      } else {
        return 'assets/Images/two.png';
      }
    }

    String resultText = getResultText(score);
    String resultImage = getResulImage(score);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Your score',
                  style: onboardstyle,
                ),
              ],
            ),
            SizedBox(height: 15),
            Image.asset(
              resultImage,
              width: double.infinity,
            ),
            SizedBox(height: 15),
            Text(
              '${score.toStringAsFixed(0)} of 15',
              style: onboardstyle.copyWith(color: primary),
            ),
            Text(
              '${resultText}',
              style: discriptstyle.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                QuizResult quiz = QuizResult(
                    correctAnswers: score,
                    completionText: resultText,
                    date: DateTime.now());

                Provider.of<QuizGameProvider>(context, listen: false)
                    .addQuizResult(quiz);
                Navigator.of(context).pushNamed('/main');
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
          ],
        ),
      ),
    );
  }
}
