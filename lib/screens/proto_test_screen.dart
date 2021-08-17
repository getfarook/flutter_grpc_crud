import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'package:grpc/grpc.dart';

import '../providers/Products.dart';


import '../protos_out/calc.pb.dart';
import '../protos_out/calc.pbgrpc.dart';

class ProtoTest extends StatefulWidget {
  static const String routeName = '/proto-test';

  @override
  _ProtoTestState createState() => _ProtoTestState();
}

class _ProtoTestState extends State<ProtoTest> {
  final _form = GlobalKey<FormState>();



  var client = CalcServiceClient(
    ClientChannel(
      "10.0.2.2",
      port: 50051,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    ),
  );

  var _inputValues = {
    'X': 0,
    'Y': 0,
  };

  var _result = 0;

  var myInputs = Inputs()
    ..x = 0
    ..y = 0
  ;




  Future<CalcResponse> sendInput() async {
    return await client.calc(
      CalcRequest()
          ..inputs = myInputs
    );
  }


  _fetchAndSetRPC(){

  }


  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    if(!isValid){
      return;
    }
    _form.currentState.save();


    myInputs.x = _inputValues['X'];
    myInputs.y = _inputValues['Y'];

    var resp = await sendInput();
    print(resp.result);


    var sum = _inputValues['X'] + _inputValues['Y'];

    setState(() {
      _result = resp.result;
    });

    print(_inputValues);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GRPC Testing'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[

              TextFormField(
                initialValue: '',
                decoration: InputDecoration(labelText: 'X'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if(value.isEmpty){
                    return 'Please enter a price';
                  }
                  if(int.tryParse(value) == null) {
                    return 'Please enter a valid integer';
                  }
                  return null;
                },
                onSaved: (value) {
                  _inputValues['X'] = int.parse(value);
                },


              ),

              TextFormField(
                initialValue: '',
                decoration: InputDecoration(labelText: 'Y'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if(value.isEmpty){
                    return 'Please enter a price';
                  }
                  if(int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _inputValues['Y'] = int.parse(value);
                },
              ),

              FlatButton(
                child: Text('Submit'),
                onPressed: _saveForm,
                color: Colors.black54,
              ),

              FlatButton(
                child: Text('fetchAndSetRPC test'),
                onPressed: _fetchAndSetRPC,
                color: Colors.black54,
              ),

              Card(
                elevation: 5.0,
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.center,
                  child: Text('Result is : $_result'),
                ),
              ),

            ],
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
