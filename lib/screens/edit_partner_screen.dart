import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/partners.dart';
import '../providers/partner.dart';

class EditPartnerScreen extends StatefulWidget {
  static const String routeName = '/edit-partner';

  @override
  _EditPartnerScreenState createState() => _EditPartnerScreenState();
}

class _EditPartnerScreenState extends State<EditPartnerScreen> {
  final _openBalFocusNode = FocusNode();
  final _currBalFocusNode = FocusNode();
  final _contactNoFocusNode = FocusNode();
  final _detailsFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  var _editedPartner = Partner(
    id: null,
    name: '',
    openBal: 0,
    currBal: 0,
    contactNo: '',
    details: '',
  );

  var _initValues = {
    'name': '',
    'openBal': '',
    'currBal': '',
    'contactNo': '',
    'details': '',
  };

  var _isInit = true;
  var _isLoading = false;



  @override
  void didChangeDependencies() {
    if (_isInit) {
      final partnerId = ModalRoute.of(context).settings.arguments as int;
      if (partnerId != null) {
        _editedPartner =
            Provider.of<Partners>(context, listen: false).findById(partnerId);
        _initValues = {
          'name': _editedPartner.name,
          'openBal': _editedPartner.openBal.toString(),
          'currBal': _editedPartner.currBal.toString(),
          'contactNo': _editedPartner.contactNo,
          'details': _editedPartner.details,
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _openBalFocusNode.dispose();
    _currBalFocusNode.dispose();
    _contactNoFocusNode.dispose();
    _detailsFocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });

    if (_editedPartner.id != null) {
      await Provider.of<Partners>(context, listen: false)
          .updatePartnerRpc(_editedPartner.id, _editedPartner);

        Navigator.of(context).pop();
    } else {
      try {
//        await Provider.of<Partners>(context, listen: false)
//            .addPartner(_editedPartner);
          await Provider.of<Partners>(context, listen: false)
              .addPartnerRpc(_editedPartner);

        Navigator.of(context).pop();
      } catch (error) {
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
        title: Text('Edit Partner'),
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
                  FocusScope.of(context).requestFocus(_openBalFocusNode);
                },
                validator: (value){
                  if(value.isEmpty){
                    return 'Please provide a name';
                  }
                  return null;
                },
                onSaved: (value){
                  _editedPartner.name = value;
                },
              ),

              TextFormField(
                initialValue: _initValues['openBal'],
                decoration: InputDecoration(labelText: 'Opening Balance'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _openBalFocusNode,
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_currBalFocusNode);
                },
                validator: (value) {
                  if(value.isEmpty){
                    return 'Please enter a balance';
                  }
                  if(double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedPartner.openBal = double.parse(value);
                },
              ),


              TextFormField(
                initialValue: _initValues['currBal'],
                decoration: InputDecoration(labelText: 'Current Balance'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _currBalFocusNode,
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_contactNoFocusNode);
                },
                validator: (value) {
                  if(value.isEmpty){
                    return 'Please enter a current balance';
                  }
                  if(double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedPartner.currBal = double.parse(value);
                },
              ),


              TextFormField(
                initialValue: _initValues['contactNo'],
                decoration: InputDecoration(labelText: 'Contact No'),
                textInputAction: TextInputAction.next,
                //maxLines: 3,
                //keyboardType: TextInputType.multiline,
                focusNode: _contactNoFocusNode,
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_detailsFocusNode);
                },
                validator: (value) {
                  if(value.isEmpty){
                    return 'Please enter a contact Number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedPartner.contactNo = value;
                },
              ),

              TextFormField(
                initialValue: _initValues['details'],
                decoration: InputDecoration(labelText: 'Details'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _detailsFocusNode,
                validator: (value) {
                  if(value.isEmpty){
                    return 'Please enter details';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedPartner.details = value;
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
