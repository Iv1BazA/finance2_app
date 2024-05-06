import 'package:finance2_app/const/app_colors.dart';
import 'package:finance2_app/const/app_images.dart';
import 'package:finance2_app/const/questions_for_quiz.dart';
import 'package:finance2_app/screens/quiz/score_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  List<String?> selectedAnswers = [];

  void _answerQuestion(String? answer) {
    setState(() {
      selectedAnswers[currentQuestionIndex] = answer;
    });
  }

  void _nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ScoreScreenWidget(
            score: _calculateScore(),
          ),
        ));
      }
    });
  }

  int _calculateScore() {
    int correctAnswers = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i].correctAnswer) {
        correctAnswers++;
      }
    }
    return correctAnswers;
  }

  @override
  void initState() {
    super.initState();
    selectedAnswers = List.filled(questions.length, null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 45),
            GestureDetector(
              onTap: () {
                if (currentQuestionIndex == 0) {
                  Navigator.of(context).pop();
                } else {
                  setState(() {});
                  currentQuestionIndex--;
                }
              },
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.chevron_left, color: Colors.black),
                    Text('Back'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text(
                  '${currentQuestionIndex + 1}/15',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Row(
                    children: List.generate(
                      questions.length,
                      (index) => Container(
                        width: 15,
                        height: 10,
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: index == currentQuestionIndex
                              ? Color(0xFF1144FA)
                              : Color(0xFFF3F6FF),
                          borderRadius: BorderRadius.circular(90),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              '${currentQuestionIndex + 1}. ${questions[currentQuestionIndex].text}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.0),
            ...questions[currentQuestionIndex]
                .answers
                .map((answer) => GestureDetector(
                      onTap: () {
                        _answerQuestion(answer);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: selectedAnswers[currentQuestionIndex] == answer
                              ? primary
                              : Color(0xFFF3F6FF),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          answer,
                          style: TextStyle(
                            color:
                                selectedAnswers[currentQuestionIndex] == answer
                                    ? Colors.white
                                    : Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ))
                .toList(),
            Spacer(),
            GestureDetector(
              onTap: () {
                _nextQuestion();
              },
              child: Container(
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  final Question question;
  final String? selectedAnswer;
  final Function(String?) onSelectAnswer;

  const QuestionWidget({
    required this.question,
    required this.selectedAnswer,
    required this.onSelectAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              question.text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: question.answers.map((answer) {
              return ListTile(
                leading: selectedAnswer == answer
                    ? Icon(Icons.check_circle)
                    : Icon(Icons.radio_button_unchecked),
                title: Text(answer),
                onTap: () {
                  onSelectAnswer(answer);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
