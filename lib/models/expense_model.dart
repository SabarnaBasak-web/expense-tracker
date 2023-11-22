import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/* 
  {
    title: String;
    amount: double;
    type: Expense | Income ;
    date: date;

  }
 */

class ExpenseProvider extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final List<Map<String, dynamic>> expenseList = [];
  late double _totalBudget = 0.0;

  double get getTotalBudget => _totalBudget;
  Future<void> addExpenseOrIncome(Map<String, dynamic> data) async {
    print("data- $data");
    expenseList.add(data);

    // firestore
    //     .collection('users')
    //     .doc(auth.currentUser!.uid)
    //     .collection('Transactions')
    //     .add(data);
    print('## totalBudget -- $_totalBudget');
    // var totalBudgetRef =
    //     firestore.collection('users').doc(auth.currentUser!.uid);

    // totalBudgetRef.collection('Total Budget').doc('total').get().then((doc) {
    //   if (doc.exists) {
    //     totalBudget = doc.data()!['amount'];
    //     if (data['type'] == 'Expense') {
    //       totalBudget -= data['amount'];
    //     } else {
    //       totalBudget += data['amount'];
    //     }
    //     totalBudgetRef
    //         .collection('Total Budget')
    //         .doc('total')
    //         .update({'amount': totalBudget});
    //   }
    // }).catchError((err) {
    //   print('some error occured $err');
    // });
    print('## totalBudget $_totalBudget');
    notifyListeners();
  }

  List<Map<String, dynamic>> getAllExpense() {
    return expenseList;
  }

  void fetchTotalBudget() async {
    firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('Total Budget')
        .doc('total')
        .get()
        .then((doc) {
      if (doc.exists) {
        double amount = doc.data()!['amount'];
        setTotalBudget(amount);
      }

      print('called fetchTotalbudget');
      notifyListeners();
    });
  }

  void setTotalBudget(double val) {
    _totalBudget = val;
    print('called setTotalbudget');
    notifyListeners();
  }
}
