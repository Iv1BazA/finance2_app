import 'package:finance2_app/const/app_colors.dart';
import 'package:finance2_app/const/app_styles.dart';
import 'package:finance2_app/const/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class QuizEndWidget extends StatelessWidget {
  const QuizEndWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final quizList = Provider.of<QuizGameProvider>(context).quizResults;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Text(
            'Quiz',
            style: onboardstyle,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.4,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: quizList.length,
              itemBuilder: (context, index) {
                final quiz = quizList[index];
                return Container(
                  height: 146,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: primary.withOpacity(0.08),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${DateFormat('MM/dd/yyyy').format(quiz.date!)}',
                          style: discriptstyle.copyWith(fontSize: 14),
                        ),
                        Text(
                          '${quiz.correctAnswers}/15',
                          style: discriptstyle.copyWith(
                              color: primary, fontSize: 32),
                        ),
                        SizedBox(height: 15),
                        Expanded(
                          child: Text(
                            '${quiz.completionText}',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/quiz');
            },
            child: Container(
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  'Play again',
                  style: buttonText,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
