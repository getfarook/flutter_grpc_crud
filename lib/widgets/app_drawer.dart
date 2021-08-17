import 'package:flutter/material.dart';
import 'package:sales_pro/screens/invoices_screen.dart';
import '../screens/products_screen.dart';
import '../screens/partners_screen.dart';
import '../screens/proto_test_screen.dart';


class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Menu'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Invoices'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(InvoicesScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Products'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(ProductsScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Partners'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(PartnersScreen.routeName);
            },
          ),

          Divider(),
          ListTile(
            leading: Icon(Icons.settings_ethernet),
            title: Text('GRPC Test'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(ProtoTest.routeName);
            },
          ),

        ],
      ),
    );
  }
}
