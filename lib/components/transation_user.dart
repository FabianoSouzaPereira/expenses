import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:expenses/components/transaction_Form.dart';
import 'package:expenses/components/transaction_List.dart';

class TransationUser extends StatefulWidget {
  TransationUser({Key? key}) : super(key: key);

  @override
  State<TransationUser> createState() => _TransationUserState();
}

class _TransationUserState extends State<TransationUser> {
  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Novo tenis da nike',
        value: 358.00,
        date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Conta de luz', value: 211.44, date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
