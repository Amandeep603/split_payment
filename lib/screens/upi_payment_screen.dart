import 'package:flutter/material.dart';
import 'package:upi_india/upi_india.dart';

class UpiPaymentScreen extends StatefulWidget {
  @override
  _UpiPaymentScreenState createState() => _UpiPaymentScreenState();
}

class _UpiPaymentScreenState extends State<UpiPaymentScreen> {
  late UpiIndia _upiIndia;
  late Future<List<UpiApp>> _appsFuture;

  @override
  void initState() {
    super.initState();
    _upiIndia = UpiIndia();
    _appsFuture = _upiIndia.getAllUpiApps();
  }

  Future<void> initiateTransaction(UpiApp app) async {
    UpiResponse? response = await _upiIndia.startTransaction(
      app: app,
      receiverUpiId: 'merchant_vpa@bank',
      receiverName: 'Merchant Name',
      transactionRefId: 'T1234',
      transactionNote: 'Payment for Group',
      amount: 2000.00,
    );

    if (response != null) {
      print('Transaction status: ${response.status}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select UPI App')),
      body: FutureBuilder<List<UpiApp>>(
        future: _appsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No UPI apps found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                UpiApp app = snapshot.data![index];
                return ListTile(
                  leading: Image.memory(app.icon),
                  title: Text(app.name),
                  onTap: () => initiateTransaction(app),
                );
              },
            );
          }
        },
      ),
    );
  }
}
