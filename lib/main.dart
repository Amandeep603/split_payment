import 'package:flutter/material.dart';
import 'screens/group_creation_screen.dart';
import 'screens/group_payment_screen.dart';
import 'screens/balance_tracking_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Group Expense Splitter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => GroupCreationScreen(),
        '/payment': (context) => GroupPaymentScreen(),
        '/balance': (context) => BalanceTrackingScreen(),
      },
    );
  }
}
