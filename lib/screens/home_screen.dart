// library
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// provider
import 'package:expense_tracker_app/models/expense_model.dart';

// components
import 'package:expense_tracker_app/components/budget_card.dart';
import 'package:expense_tracker_app/components/custom_text.dart';
import 'package:expense_tracker_app/components/custom_text_field.dart';
import 'package:expense_tracker_app/components/separtor.dart';

import '../models/auth_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final expenseTitleController = TextEditingController();
  final amountController = TextEditingController();
  final expenseProvider = ExpenseProvider();
  bool switchValue = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    expenseProvider.fetchTotalBudget();
  }

  void onPressed(BuildContext context) {
    addExpenseDialog(context);
  }

  void onSwitchValueChange(bool val) {
    setState(() {
      switchValue = val;
    });
  }

  void onCancel(context) {
    expenseTitleController.clear();
    amountController.clear();
    setState(() {
      switchValue = false;
    });
    Navigator.pop(context);
  }

  void onSave() {
    var expenseModel = context.read<ExpenseProvider>();
    var dataEntered = {
      'title': expenseTitleController.text,
      'amount': double.parse(amountController.text),
      'type': switchValue ? 'Income' : 'Expense',
      'date': DateTime.now(),
    };
    expenseModel.addExpenseOrIncome(dataEntered);

    onCancel(context);
  }

  void signOutHandler() {
    final AuthService authService =
        Provider.of<AuthService>(context, listen: false);
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    // print('budgett---- ${Provider.of(context)['totalBudget']}');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent.shade700,
        onPressed: () => onPressed(context),
        child: const Icon(
          Icons.note_add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade700,
        title: const CustomText(
          text: 'Dashboard',
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontColor: Colors.white,
        ),
        actions: [
          IconButton(
              onPressed: signOutHandler,
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            BudgetCard(),
          ],
        ),
      ),
    );
  }

  Future<dynamic> addExpenseDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const CustomText(
              text: 'Add Expense',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                        controller: expenseTitleController,
                        hintText: 'Title',
                        iconName: Icons.title_rounded),
                    const Separtor(height: 10),
                    CustomTextField(
                      controller: amountController,
                      hintText: 'Amount',
                      iconName: Icons.currency_rupee,
                      keyboardType: TextInputType.number,
                    ),
                    const Separtor(height: 10),
                    CustomText(
                      text:
                          'Note: toggle switch to change between income and expense',
                      fontSize: 12,
                      fontColor: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: switchValue ? 'Income' : 'Expense',
                          fontWeight: FontWeight.bold,
                          fontColor: Colors.grey.shade700,
                        ),
                        Switch(
                          // This bool value toggles the switch.
                          value: switchValue,
                          activeColor: Colors.blueAccent.shade400,
                          inactiveThumbColor: Colors.blueAccent.shade400,
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              switchValue = value;
                            });
                            onSwitchValueChange(switchValue);
                          },
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
            actions: [
              GestureDetector(
                onTap: onSave,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.shade700,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8.0),
                    child: CustomText(
                        text: 'Save',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontColor: Colors.grey.shade200),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => onCancel(context),
                child: CustomText(
                    text: 'Cancel',
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    fontColor: Colors.grey.shade600),
              ),
            ],
          );
        });
  }
}
