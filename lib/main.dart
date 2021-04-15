import 'package:flutter/material.dart';
import 'views/home.dart';

void main() => runApp(ExpensesApp());

class ExpensesApp extends StatefulWidget {
  @override
  _ExpensesAppState createState() => _ExpensesAppState();
}

class _ExpensesAppState extends State<ExpensesApp> {
  bool isLight = true;
  void _changeTheme(bool _isLight) {
    setState(() {
      isLight = !_isLight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isLight
          ? ThemeData.light().copyWith(
              appBarTheme: AppBarTheme(
                textTheme: ThemeData.light().textTheme.copyWith(
                      headline6: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ),
              ),
            )
          : ThemeData.dark().copyWith(
              appBarTheme: AppBarTheme(
                textTheme: ThemeData.light().textTheme.copyWith(
                      headline6: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
              ),
            ),
      home: Home(_changeTheme),
    );
  }
}
