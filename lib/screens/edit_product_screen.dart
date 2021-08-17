import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grpc/grpc.dart';

import '../providers/product.dart';
import '../providers/Products.dart';

import '../protos_out/prod.pb.dart' as pb1;
import '../protos_out/prod.pbgrpc.dart' as pb2;


class EditProductScreen extends StatefulWidget {
  static const String routeName = '/edit-product';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  var _editedProduct = Product(
    id: null,
    name: '',
    price: 0,
    description: '',
  );

  var _initValues = {
    'name': '',
    'price': '',
    'description': '',
  };

  var _isInit = true;
  var _isLoading = false;


  @override
  void didChangeDependencies() {
    if(_isInit){
     // final productId = ModalRoute.of(context).settings.arguments as String;
      final productId = ModalRoute.of(context).settings.arguments as int;
      if(productId != null){
        _editedProduct = Provider.of<Products>(context, listen: false).findById(productId);
        _initValues = {
          'name': _editedProduct.name,
          'price': _editedProduct.price.toString(),
          'description': _editedProduct.description,
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }


  @override
  void dispose() {
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }


  var client = pb2.ProductServiceClient(
    ClientChannel(
      "10.0.2.2",
      port: 50051,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    ),
  );




  Future<pb1.ProdId> sendInput() async {
    return await client.addProduct(
        pb1.Product()
          ..name = _editedProduct.name
          ..price = _editedProduct.price
          ..details = _editedProduct.description
    );
  }


  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    if(!isValid){
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });

    if (_editedProduct.id != null){
      await Provider.of<Products>(context, listen: false)
          .updateProductRpc(_editedProduct.id, _editedProduct);
      Navigator.of(context).pop();

    }else {
      try{
        await Provider.of<Products>(context, listen: false).addProductRpc(_editedProduct);
        //var resp = await sendInput();
        //print('The id of the inserted product is: ${resp.id}');
        Navigator.of(context).pop();
      }catch(error){
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('An error occurred'),
            content: Text(error.toString()),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
            ],
          ),
        );
      }
    }

    setState(() {
      _isLoading = false;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[

                    TextFormField(
                      initialValue: _initValues['name'],
                      decoration: InputDecoration(labelText: 'Name'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_priceFocusNode);
                      },
                      validator: (value){
                        if(value.isEmpty){
                          return 'Please provide a name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                          name: value,
                          price: _editedProduct.price,
                          description: _editedProduct.description,
                          id: _editedProduct.id,
                        );
                      },
                    ),

                    TextFormField(
                      initialValue: _initValues['price'],
                      decoration: InputDecoration(labelText: 'Price'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      focusNode: _priceFocusNode,
                      onFieldSubmitted: (_){
                        FocusScope.of(context).requestFocus(_descriptionFocusNode);
                      },
                      validator: (value) {
                        if(value.isEmpty){
                          return 'Please enter a price';
                        }
                        if(double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        if(double.parse(value) <= 0) {
                          return 'Please enter a price greater than zero';
                        }
                        return null;
                      },

                      onSaved: (value) {
                        _editedProduct = Product(
                          name: _editedProduct.name,
                          price: double.parse(value),
                          description: _editedProduct.description,
                          id: _editedProduct.id,
                        );
                      },
                    ),

                    TextFormField(
                      initialValue: _initValues['description'],
                      decoration: InputDecoration(labelText: 'Description'),
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      focusNode: _descriptionFocusNode,
                      validator: (value) {
                        if(value.isEmpty){
                          return 'Please enter a description';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                          name: _editedProduct.name,
                          price: _editedProduct.price,
                          description: value,
                          id: _editedProduct.id,
                        );
                      },
                    ),

                  ],
                ),
              ),
            ),
    );
  }
}
