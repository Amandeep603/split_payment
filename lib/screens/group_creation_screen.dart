import 'package:flutter/material.dart';
import '../models/group.dart';
import '../models/member.dart';

class GroupCreationScreen extends StatefulWidget {
  @override
  _GroupCreationScreenState createState() => _GroupCreationScreenState();
}

class _GroupCreationScreenState extends State<GroupCreationScreen> {
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _memberNameController = TextEditingController();
  List<Member> members = [];
  double totalAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Group"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _groupNameController,
              decoration: InputDecoration(labelText: "Group Name"),
            ),
            TextField(
              controller: _memberNameController,
              decoration: InputDecoration(labelText: "Member Name"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  members.add(Member(name: _memberNameController.text, amountOwed: 0));
                  _memberNameController.clear();
                });
              },
              child: Text("Add Member"),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: members.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(members[index].name),
                );
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Total Amount"),
              onChanged: (value) {
                setState(() {
                  totalAmount = double.parse(value);
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/payment', arguments: Group(
                  id: DateTime.now().toString(),
                  name: _groupNameController.text,
                  members: members,
                  totalAmount: totalAmount,
                ));
              },
              child: Text("Create Group"),
            ),
          ],
        ),
      ),
    );
  }
}
