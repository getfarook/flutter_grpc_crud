import 'package:flutter/material.dart';
import 'package:sales_pro/widgets/app_drawer.dart';
import'./edit_product_screen.dart';
import '../providers/Products.dart';
import 'package:provider/provider.dart';
import '../widgets/product_item.dart';

class ProductsScreen extends StatefulWidget {
  static const routeName = '/products';

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  var _isInit = true;


  Future<void> _refreshProducts(BuildContext context) async {
    //await Provider.of<Products>(context, listen: false).fetchAndSetProducts();
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
    final productsData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),


        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
              itemCount: productsData.items.length,
              itemBuilder: (_, i) => Column(
                children: <Widget>[
                  ProductItem(
                    productsData.items[i].id,
                    productsData.items[i].name,
                    productsData.items[i].price,
                    productsData.items[i].description,
                  ),
                ],
              )
          ),
        ),
      ),

    );
  }
}
