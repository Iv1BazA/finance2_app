import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpensesModel {
  final int? cost;
  final DateTime? date;
  final String? category;

  ExpensesModel({this.cost, this.date, this.category});

  Map<String, dynamic> toJson() {
    return {
      'cost': cost,
      'date': date?.millisecondsSinceEpoch,
      'category': category,
    };
  }

  factory ExpensesModel.fromJson(Map<String, dynamic> json) {
    return ExpensesModel(
      cost: json['cost'],
      date: json['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['date'])
          : null,
      category: json['category'],
    );
  }
}

class ExpensesProvider extends ChangeNotifier {
  List<ExpensesModel> expensesList = [];

  void addExpense(ExpensesModel expense) {
    expensesList.add(expense);
    saveExpenses();
    notifyListeners();
  }

  List<ExpensesModel> getExpensesForDate(DateTime date) {
    return expensesList
        .where((expense) =>
            expense.date != null &&
            expense.date!.year == date.year &&
            expense.date!.month == date.month &&
            expense.date!.day == date.day &&
            expense.cost != null)
        .toList();
  }

  Map<DateTime, int> getExpensesByDate(DateTime startDate, DateTime endDate) {
    Map<DateTime, int> expensesByDate = {};

    for (ExpensesModel expense in expensesList) {
      if (expense.date != null &&
          expense.date!.isAfter(startDate) &&
          expense.date!.isBefore(endDate)) {
        if (expensesByDate.containsKey(expense.date!)) {
          expensesByDate[expense.date!] =
              expensesByDate[expense.date!]! + expense.cost!;
        } else {
          expensesByDate[expense.date!] = expense.cost!;
        }
      }
    }

    return expensesByDate;
  }

  void resetValues() async {
    expensesList.clear();
    await saveExpenses();
    notifyListeners();
  }

  Future<void> saveExpenses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> expensesJsonList =
        expensesList.map((e) => json.encode(e.toJson())).toList();
    prefs.setStringList('expenses', expensesJsonList);
  }

  Future<void> loadExpenses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? expensesJsonList = prefs.getStringList('expenses');
    if (expensesJsonList != null) {
      expensesList = expensesJsonList.map((e) {
        ExpensesModel expense = ExpensesModel.fromJson(json.decode(e));

        return expense;
      }).toList();
    }
  }

  double getTotalExpenses() {
    double totalExpenses = 0;
    for (var expense in expensesList) {
      totalExpenses += expense.cost!;
    }
    return totalExpenses;
  }
}

class IncomeModel {
  final int? cost;
  final DateTime? date;
  final String? category;

  IncomeModel({this.cost, this.date, this.category});
  @override
  String toString() {
    return 'IncomeModel(cost: $cost, date: $date, category: $category)';
  }

  Map<String, dynamic> toJson() {
    return {
      'cost': cost,
      'date': date?.millisecondsSinceEpoch,
      'category': category,
    };
  }

  factory IncomeModel.fromJson(Map<String, dynamic> json) {
    return IncomeModel(
      cost: json['cost'],
      date: json['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['date'])
          : null,
      category: json['category'],
    );
  }
}

class IncomeProvider extends ChangeNotifier {
  List<IncomeModel> incomeList = [];

  void addIncome(IncomeModel income) {
    incomeList.add(income);
    saveIncome();
    notifyListeners();
  }

  List<IncomeModel> getIncomeForDate(DateTime date) {
    return incomeList
        .where((income) =>
            income.date != null &&
            income.date!.year == date.year &&
            income.date!.month == date.month &&
            income.date!.day == date.day)
        .toList();
  }

  Map<DateTime, int> getIncomeByDate(DateTime startDate, DateTime endDate) {
    Map<DateTime, int> incomeByDate = {};

    for (IncomeModel income in incomeList) {
      if (income.date != null &&
          income.date!.isAfter(startDate) &&
          income.date!.isBefore(endDate)) {
        if (incomeByDate.containsKey(income.date!)) {
          incomeByDate[income.date!] =
              incomeByDate[income.date!]! + income.cost!;
        } else {
          incomeByDate[income.date!] = income.cost!;
        }
      }
    }

    return incomeByDate;
  }

  void resetValues() async {
    incomeList.clear();
    await saveIncome();
    notifyListeners();
  }

  Future<void> saveIncome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> incomeJsonList =
        incomeList.map((e) => json.encode(e.toJson())).toList();
    prefs.setStringList('income', incomeJsonList);
  }

  Future<void> loadIncome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? incomeJsonList = prefs.getStringList('income');
    if (incomeJsonList != null) {
      incomeList = incomeJsonList.map((e) {
        IncomeModel income = IncomeModel.fromJson(json.decode(e));

        return income;
      }).toList();
    }
  }

  double getTotalIncome() {
    double totalIncome = 0;
    for (var income in incomeList) {
      totalIncome += income.cost!;
    }
    return totalIncome;
  }
}

class QuizResult {
  final int correctAnswers;
  final String completionText;
  final DateTime date;

  QuizResult({
    required this.correctAnswers,
    required this.completionText,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'correctAnswers': correctAnswers,
      'completionText': completionText,
      'date': date.toIso8601String(),
    };
  }

  factory QuizResult.fromMap(Map<String, dynamic> map) {
    return QuizResult(
      correctAnswers: map['correctAnswers'],
      completionText: map['completionText'],
      date: DateTime.parse(map['date']),
    );
  }
}

class QuizGameProvider extends ChangeNotifier {
  List<QuizResult> _quizResults = [];
  final String _prefsKey = 'quiz_results';

  List<QuizResult> get quizResults => _quizResults;
  void addQuizResult(QuizResult result) {
    _quizResults.add(result);
    _saveQuizResults();
    notifyListeners();
  }

  void clearQuizResults() {
    _quizResults.clear();
    _saveQuizResults();
    notifyListeners();
  }

  Future<void> _saveQuizResults() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> resultsJsonList =
        _quizResults.map((result) => json.encode(result.toMap())).toList();
    prefs.setStringList(_prefsKey, resultsJsonList);
  }

  Future<void> loadQuizResults() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? resultsJson = prefs.getStringList(_prefsKey);
    if (resultsJson != null) {
      try {
        _quizResults = resultsJson
            .map((resultJson) => QuizResult.fromMap(jsonDecode(resultJson)))
            .toList();
      } catch (e) {
        print('Error decoding quiz results: $e');
      }
    }
  }
}

class News {
  final String icon;
  final String title;
  final String image;
  final String discription;
  final String time;

  News(
      {required this.icon,
      required this.title,
      required this.image,
      required this.discription,
      required this.time});
}
