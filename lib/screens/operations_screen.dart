import 'package:finance2_app/const/app_colors.dart';
import 'package:finance2_app/const/app_styles.dart';
import 'package:finance2_app/const/model.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ExpensesWidget extends StatefulWidget {
  const ExpensesWidget({Key? key});

  @override
  State<ExpensesWidget> createState() => _ExpensesWidgetState();
}

class _ExpensesWidgetState extends State<ExpensesWidget> {
  int selecetedIndex = 0;

  final cost = TextEditingController();
  final datecontroller = TextEditingController();
  final categoryname = TextEditingController();
  final MaskTextInputFormatter dateMaskFormatter = MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: currentDate.subtract(Duration(days: 365)),
      lastDate: currentDate.add(Duration(days: 365)),
    );

    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        datecontroller.text = DateFormat('dd.MM.yyyy').format(pickedDate);
      });
    }
  }

  String? _selectedCategory;

  final List<String> _categoriesIncome = [
    'Salary',
    'Freelance',
    'Investments',
    'Rental Income',
    'Side Jobs',
    'Bonuses and Awards',
    'Passive Income',
    'Social Benefits',
    'Sales',
    'Consulting and Training'
  ];
  final List<String> _categoriesExpenses = [
    'Housing',
    'Food',
    'Transportation',
    'Health',
    'Entertainment',
    'Clothing and Footwear',
    'Education',
    'Personal Expenses',
    'Debts and Loans',
    'Unexpected Expenses'
  ];
  void addExpense() {
    ExpensesModel expense = ExpensesModel(
      cost: int.parse(cost.text),
      date: DateFormat('dd.MM.yyyy').parse(datecontroller.text),
      category: categoryname.text,
    );
    Provider.of<ExpensesProvider>(context, listen: false).addExpense(expense);
  }

  void addIncome() {
    IncomeModel income = IncomeModel(
      cost: int.parse(cost.text),
      date: DateFormat('dd.MM.yyyy').parse(datecontroller.text),
      category: categoryname.text,
    );
    Provider.of<IncomeProvider>(context, listen: false).addIncome(income);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
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
            Container(
                height: 32,
                decoration: BoxDecoration(
                    color: primary.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(9)),
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.5),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selecetedIndex != 0) {
                              selecetedIndex = 0;
                            }
                          });
                        },
                        child: Container(
                          height: 28,
                          decoration: BoxDecoration(
                              color: selecetedIndex == 0
                                  ? primary
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              'Incomes',
                              style: discriptstyle.copyWith(
                                color: selecetedIndex == 0
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.5),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selecetedIndex != 1) {
                              selecetedIndex = 1;
                            }
                          });
                        },
                        child: Container(
                          height: 28,
                          decoration: BoxDecoration(
                              color: selecetedIndex == 1
                                  ? primary
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              'Expenses',
                              style: discriptstyle.copyWith(
                                color: selecetedIndex == 1
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ))
                  ],
                )),
            SizedBox(height: 35),
            TextFormField(
              controller: categoryname,
              style: TextStyle(color: Colors.black),
              decoration: decorationsField.copyWith(
                  hintText: 'Category',
                  suffixIcon: PopupMenuButton<String>(
                      icon: Icon(Icons.arrow_drop_down),
                      itemBuilder: (BuildContext context) {
                        if (selecetedIndex == 0) {
                          return _categoriesIncome.map((String category) {
                            return PopupMenuItem<String>(
                              value: category,
                              child: Text(category),
                            );
                          }).toList();
                        } else {
                          return _categoriesExpenses.map((String category) {
                            return PopupMenuItem<String>(
                              value: category,
                              child: Text(category),
                            );
                          }).toList();
                        }
                      },
                      onSelected: (String? value) {
                        setState(() {
                          _selectedCategory = value;
                          categoryname.text = value ?? '';
                        });
                      })),
              readOnly: true,
            ),
            SizedBox(height: 15),
            TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: cost,
                style: TextStyle(color: Colors.black),
                decoration: decorationsField.copyWith(hintText: '\$ Amount')),
            SizedBox(height: 15),
            TextField(
              onChanged: (value) {
                setState(() {});
              },
              readOnly: true,
              controller: datecontroller,
              style: TextStyle(color: Colors.black),
              decoration: decorationsField.copyWith(hintText: 'Date'),
              onTap: () {
                _selectDate(context);
              },
            ),
            SizedBox(height: 25),
            GestureDetector(
              onTap: categoryname.text.isNotEmpty &&
                      cost.text.isNotEmpty &&
                      datecontroller.text.isNotEmpty
                  ? () {
                      if (selecetedIndex == 0) {
                        addIncome();
                      } else if (selecetedIndex == 1) {
                        addExpense();
                      }
                      Navigator.of(context).pushNamed('/main');
                    }
                  : null,
              child: Container(
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                    color: categoryname.text.isNotEmpty &&
                            cost.text.isNotEmpty &&
                            datecontroller.text.isNotEmpty
                        ? primary
                        : primary.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    'Next',
                    style: buttonText.copyWith(
                        color: categoryname.text.isNotEmpty &&
                                cost.text.isNotEmpty &&
                                datecontroller.text.isNotEmpty
                            ? Colors.white
                            : Colors.white.withOpacity(0.3)),
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
