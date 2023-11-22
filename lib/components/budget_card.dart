import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/expense_model.dart';

import 'custom_text.dart';

class BudgetCard extends StatelessWidget {
  const BudgetCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ExpenseProvider>(context, listen: true);
    print('## data--- ${data.getTotalBudget}');
    return Consumer<ExpenseProvider>(
      builder: (context, value, child) {
        print('## value $value');
        // var budgetAmount = value['_totalBudget'];
        return SizedBox(
          width: 300,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.teal,
              // budgetAmount > 0 ? Colors.teal.shade400 : Colors.red.shade700,
              borderRadius: BorderRadius.circular(8),
              shape: BoxShape.rectangle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const CustomText(
                    text: 'Budget',
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    fontColor: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.currency_rupee,
                        color: Colors.white,
                        size: 18,
                      ),
                      CustomText(
                        text: '0', //'$budgetAmount',
                        fontWeight: FontWeight.bold,
                        fontColor: Colors.white,
                        fontSize: 18,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
