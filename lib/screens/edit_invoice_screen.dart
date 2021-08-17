import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grpc/grpc.dart';
import '../providers/Products.dart';

import '../protos_out/prod.pb.dart' as pb1;
import '../protos_out/prod.pbgrpc.dart' as pb2;

class EditInvoiceScreen extends StatefulWidget {
  static const String routeName = '/edit-invoice';


  @override
  _EditInvoiceScreenState createState() => _EditInvoiceScreenState();
}

class _EditInvoiceScreenState extends State<EditInvoiceScreen> {

  final _form = GlobalKey<FormState>();
  var _isLoading = false;
  var _isInit = true;


  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchAndSetProductsRpc();
  }


  @override
  void didChangeDependencies() {
    if(_isInit){
      _refreshProducts(context);
      _isInit = false;
    }
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add Invoice"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {},
            ),

          ],
        ),

        // drawer: AppDrawer(),
        body: _isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _form,
            child: ListView(
              children: <Widget>[

              ],
            ),
          ),
        )


    );
  }
}
