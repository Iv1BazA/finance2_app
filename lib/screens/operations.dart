import 'package:finance2_app/const/app_colors.dart';
import 'package:finance2_app/const/app_styles.dart';
import 'package:finance2_app/const/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class OperationsWidget extends StatefulWidget {
  const OperationsWidget({Key? key});

  @override
  State<OperationsWidget> createState() => _OperationsWidgetState();
}

class _OperationsWidgetState extends State<OperationsWidget> {
  int selecetedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Row(
            children: [
              Text(
                'Operations',
                style: onboardstyle,
              ),
            ],
          ),
          SizedBox(height: 20),
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
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            'Incomes',
                            style: discriptstyle.copyWith(color: Colors.black),
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
                            color: selecetedIndex == 0
                                ? Colors.transparent
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            'Expenses',
                            style: discriptstyle.copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ))
                ],
              )),
          SizedBox(height: 35),
          Container(
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: primary),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hello!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1),
                            color: Color(0xffFFFFFF)),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${selecetedIndex == 0 ? 'Your amount of income' : 'Your amount of expenses'}',
                        style: TextStyle(
                          color: Color(0xffFFFDFD),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${selecetedIndex == 0 ? '\$' : '-\$'} ${selecetedIndex == 0 ? (Provider.of<IncomeProvider>(context).getTotalIncome()).toStringAsFixed(0) : (Provider.of<ExpensesProvider>(context).getTotalExpenses()).toStringAsFixed(0)}',
                        style: TextStyle(
                            color: Color(0xffFFFDFD),
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(
                      'assets/Images/Operations.png',
                      height: 106,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.9,
            child: Stack(
              children: [
                selecetedIndex == 0 ? Income() : Expenses(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/operations');
                    },
                    child: Container(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                          child: Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<ExpensesProvider>(context, listen: false)
            .loadExpenses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Consumer<ExpensesProvider>(
              builder: (context, expensesProvider, child) {
                return ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemCount: expensesProvider.expensesList.length,
                  itemBuilder: (context, index) {
                    final expense = expensesProvider.expensesList[index];
                    return Container(
                      height: 88,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: primary.withOpacity(0.08),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$ -${expense.cost}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: primary,
                                  ),
                                ),
                                Text(
                                  '${expense.category}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${DateFormat('MM/dd/yyyy').format(expense.date!)}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

class Income extends StatelessWidget {
  const Income({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            Provider.of<IncomeProvider>(context, listen: false).loadIncome(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Consumer<IncomeProvider>(
              builder: (context, incomeProvider, child) {
                return ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemCount: incomeProvider.incomeList.length,
                  itemBuilder: (context, index) {
                    final income = incomeProvider.incomeList[index];
                    return Container(
                      height: 88,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: primary.withOpacity(0.08),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$ ${income.cost}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: primary,
                                  ),
                                ),
                                Text(
                                  '${income.category}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${DateFormat('MM/dd/yyyy').format(income.date!)}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
