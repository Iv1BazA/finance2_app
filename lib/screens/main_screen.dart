import 'package:finance2_app/const/app_colors.dart';
import 'package:finance2_app/const/app_icons.dart';
import 'package:finance2_app/const/app_images.dart';
import 'package:finance2_app/const/app_styles.dart';
import 'package:finance2_app/const/model.dart';
import 'package:finance2_app/screens/news_screen.dart';
import 'package:finance2_app/screens/operations.dart';
import 'package:finance2_app/screens/quiz/quiz_end_screen.dart';
import 'package:finance2_app/screens/quiz/quiz_start_screen.dart';
import 'package:finance2_app/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: IndexedStack(
        index: _currentIndex,
        children: [
          Consumer2<ExpensesProvider, IncomeProvider>(
            builder: (context, expensesProvider, incomeProvider, child) {
              return (expensesProvider.expensesList.isEmpty &&
                      incomeProvider.incomeList.isEmpty)
                  ? const NoInfoWidget()
                  : const OperationsWidget();
            },
          ),
          Consumer<QuizGameProvider>(
            builder: (context, quizProvider, child) {
              return (quizProvider.quizResults.isEmpty)
                  ? const QuizStartWidget()
                  : const QuizEndWidget();
            },
          ),
          const NewsWidget(),
          const SettingsWidget()
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 14,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        selectedItemColor: primary,
        unselectedItemColor: Color(0xff24262B).withOpacity(0.5),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(homepassive),
            activeIcon: SvgPicture.asset(homeactive),
            label: 'Operations',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(quizpassive),
            activeIcon: SvgPicture.asset(quizactive),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(newspassive),
            activeIcon: SvgPicture.asset(newsactive),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(settingspassive),
            activeIcon: SvgPicture.asset(settingsactive),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class NoInfoWidget extends StatelessWidget {
  const NoInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          SizedBox(height: 30),
          Row(children: [
            Text(
              'Operations',
              style: onboardstyle,
            )
          ]),
          SizedBox(height: 70),
          Image.asset(
            noinfo,
            width: 280,
            height: 280,
          ),
          SizedBox(height: 15),
          Text('There\'s no info',
              style: onboardstyle.copyWith(fontSize: 20, color: primary)),
          SizedBox(height: 5),
          Text(
            'Add your incomes and expenses',
            style: discriptstyle,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/Images/divider.png',
            height: 112,
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/operations');
            },
            child: Container(
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  'Add new',
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
