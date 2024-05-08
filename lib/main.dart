import 'package:device_preview/device_preview.dart';
import 'package:finance2_app/const/model.dart';
import 'package:finance2_app/screens/main_screen.dart';
import 'package:finance2_app/screens/onboarding1.dart';
import 'package:finance2_app/screens/onboarding2.dart';
import 'package:finance2_app/screens/operations_screen.dart';
import 'package:finance2_app/screens/quiz/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ExpensesProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => IncomeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => QuizGameProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<IncomeProvider>(context, listen: false).loadIncome();
    Provider.of<ExpensesProvider>(context, listen: false).loadExpenses();
    Provider.of<QuizGameProvider>(context, listen: false).loadQuizResults();
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      routes: {
        '/onboard2': (context) => OnBoardingWidget2(),
        '/main': (context) => MainScreenWidget(),
        '/operations': (context) => ExpensesWidget(),
        '/quiz': (context) => QuizPage()
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences prefs;
  bool showInstructions = true;

  @override
  void initState() {
    super.initState();
    checkInstructionsStatus();
  }

  Future<void> checkInstructionsStatus() async {
    prefs = await SharedPreferences.getInstance();
    bool shouldShowInstructions = prefs.getBool('showInstructions') ?? true;

    if (mounted) {
      setState(() {
        showInstructions = shouldShowInstructions;
      });

      if (showInstructions) {
        await prefs.setBool('showInstructions', false);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnBoardingWidget1()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreenWidget()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
