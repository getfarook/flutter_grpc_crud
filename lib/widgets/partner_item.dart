import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/partners.dart';
import '../screens/edit_partner_screen.dart';


class PartnerItem extends StatelessWidget {
  final int id;
  final String name;
  final double currBal;


  PartnerItem(this.id, this.name, this.currBal);

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Icon(Icons.person),
            ),
          ),
        ),
        title: Text(
          name,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          'Current Balance: $currBal',
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).pushNamed(EditPartnerScreen.routeName, arguments: id);
                  },
                  color: Theme.of(context).primaryColor
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  try {
                    await Provider.of<Partners>(context, listen: false).deletePartnerRpc(id);
                  } catch (error) {
                    scaffold.showSnackBar(SnackBar(
                      content: Text('Deleting Failed', textAlign: TextAlign.center,),
                    ));
                  }

                },
                color: Theme.of(context).errorColor,

              ),
            ],
          ),
        ),
      ),
    );
  }
}
