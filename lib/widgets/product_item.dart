import 'package:flutter/material.dart';
import '../screens/edit_product_screen.dart';
import '../providers/Products.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  //final String id;
  final int id;
  final String name;
  final double price;
  final String description;

  ProductItem(this.id, this.name, this.price, this.description);

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
              child: Text('\$${price}'),
            ),
          ),
        ),
        title: Text(
          name,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          description,
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).pushNamed(EditProductScreen.routeName, arguments: id);
                },
                  color: Theme.of(context).primaryColor
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  try {
                    await Provider.of<Products>(context, listen: false).deleteProductRpc(id);
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
