import 'dart:math';
import 'package:controle_de_gastos/components/transaction_form.dart';
import 'package:controle_de_gastos/components/transaction_list.dart';
import 'package:controle_de_gastos/models/transaction.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final Function _changeTheme;
  Home(this._changeTheme);
  @override
  _HomeState createState() => _HomeState(_changeTheme);
}

class _HomeState extends State<Home> {
  bool _isLight = true;
  final Function _changeTheme;
  _HomeState(this._changeTheme);

  final List<Transaction> _transactions = [];
  //   Transaction(
  //     id: 't1',
  //     title: 'Tênis nike',
  //     value: 280.00,
  //     date: DateTime.now(),
  //   ),
  //   Transaction(
  //     id: 't2',
  //     title: 'Conta de luz',
  //     value: 99.63,
  //     date: DateTime.now(),
  //   ),
  //   Transaction(
  //     id: 't1',
  //     title: 'Tênis nike',
  //     value: 280.00,
  //     date: DateTime.now(),
  //   ),
  //   Transaction(
  //     id: 't2',
  //     title: 'Conta de luz',
  //     value: 99.63,
  //     date: DateTime.now(),
  //   ),
  //   Transaction(
  //     id: 't1',
  //     title: 'Tênis nike',
  //     value: 280.00,
  //     date: DateTime.now(),
  //   ),
  //   Transaction(
  //     id: 't2',
  //     title: 'Conta de luz',
  //     value: 99.63,
  //     date: DateTime.now(),
  //   ),
  // ];

  _addTransaction(String title, double value) {
    final newTrnsaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTrnsaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        // isScrollControlled: true,
        isScrollControlled: true,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Gastos'),
        // backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
            color: Colors.white,
          ),
          IconButton(
            icon: _isLight
                ? Icon(Icons.bedtime_outlined)
                : Icon(Icons.wb_sunny_outlined),
            onPressed: () {
              _changeTheme(_isLight);
              _isLight = !_isLight;
            },
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Card(
                child: Text('Placeholder Gráfico'),
                elevation: 5,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TransactionList(_transactions),
                //TransactionForm(_addTransaction),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
