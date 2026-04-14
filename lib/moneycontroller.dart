import 'package:flutter/material.dart';
import 'package:flutter_application_2/addtransactionpage.dart';
import 'package:flutter_application_2/transactionmodel.dart';
import 'package:get/get.dart';

class Moneycontroller extends GetxController {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController amountcontroller = TextEditingController();
  final TextEditingController notecontroller = TextEditingController();

  RxString transactionType = "Expense".obs;

  RxInt availableBalance = 0.obs;
  RxInt incomeBalance = 0.obs;
  RxInt expenseBalance = 0.obs;

  RxList<Transactionmodel> transactions = <Transactionmodel>[].obs;

  void Addtransactionpage() {
    final int amount = int.tryParse(amountcontroller.text) ?? 0;

    Transactionmodel newTransaction = Transactionmodel(
      id: DateTime.now().toIso8601String(),
      amount: amount,
      note: notecontroller.text,
      title: titlecontroller.text,
      transactionType: transactionType.value,
    );

    if (transactionType.value == "Expense") {
      expenseBalance.value += amount;
      availableBalance.value -= amount;
    } else {
      incomeBalance.value += amount;
      availableBalance.value += amount;
    }

    transactions.add(newTransaction);

    titlecontroller.clear();
    notecontroller.clear();
    amountcontroller.clear();

    print("......transaction added......");
  }

  void printdata() {
    if (transactions.isNotEmpty) {
      print(transactions[0].title);
    }
  }
}