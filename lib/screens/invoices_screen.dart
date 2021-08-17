import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_pro/widgets/app_drawer.dart';

import 'edit_invoice_screen.dart';


class InvoicesScreen extends StatefulWidget {
  static const routeName = '/invoices';


  @override
  _InvoicesScreenState createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends State<InvoicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Invoices"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditInvoiceScreen.routeName);
            },
          ),

        ],
      ),

      drawer: AppDrawer(),
      body: Container(
        child: Text("Hellow...play with invoices"),
      ),

    );
  }
}
