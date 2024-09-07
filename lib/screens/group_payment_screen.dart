import 'package:flutter/material.dart';
import '../models/group.dart';
import 'upi_payment_screen.dart';  // Import the UpiPaymentScreen

class GroupPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Extract Group object from route arguments safely
    final Group group = ModalRoute.of(context)!.settings.arguments as Group;

    return Scaffold(
      appBar: AppBar(
        title: Text("Pay for Group"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the total amount for the group
            Text(
              "Total Amount: ₹${group.totalAmount}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Button to navigate to the UpiPaymentScreen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpiPaymentScreen()),
                );
              },
              child: Text("Pay Now with UPI"),
            ),
          ],
        ),
      ),
    );
  }
}
