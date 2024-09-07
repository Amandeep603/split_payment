import 'package:flutter/material.dart';
import '../models/group.dart';

class BalanceTrackingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Group group = ModalRoute.of(context)!.settings.arguments as Group;

    return Scaffold(
      appBar: AppBar(
        title: Text("Balance Tracking"),
      ),
      body: ListView.builder(
        itemCount: group.members.length,
        itemBuilder: (context, index) {
          final member = group.members[index];
          return ListTile(
            title: Text(member.name),
            subtitle: Text('Owes: \$${member.amountOwed}'),
          );
        },
      ),
    );
  }
}
