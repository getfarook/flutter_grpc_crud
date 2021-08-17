import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_pro/screens/edit_invoice_screen.dart';
import 'package:sales_pro/screens/edit_partner_screen.dart';
import 'package:sales_pro/screens/edit_product_screen.dart';
import 'package:sales_pro/screens/invoices_screen.dart';
import './screens/maindashboard_screen.dart';
import './screens/products_screen.dart';
import './providers/Products.dart';
import './providers/partners.dart';
import './screens/partners_screen.dart';
import './screens/proto_test_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Partners(),
        ),
      ],
      child: MaterialApp(
        title: 'SalesPro',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: MainDashBoard(),

        routes: {
          '/': (ctx) => MainDashBoard(),
          ProductsScreen.routeName: (ctx) => ProductsScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
          PartnersScreen.routeName: (ctx) => PartnersScreen(),
          EditPartnerScreen.routeName: (ctx) => EditPartnerScreen(),
          InvoicesScreen.routeName: (ctx) => InvoicesScreen(),
          EditInvoiceScreen.routeName: (ctx) => EditInvoiceScreen(),

          ProtoTest.routeName: (ctx) => ProtoTest(),
          //  CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
          //  MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
          //  FiltersScreen.routeName: (ctx) => FiltersScreen(),
        },
        onGenerateRoute: (settings) {
          print(settings.arguments);
          // if (settings.name == '/meal-detail') {
          //   return ...;
          // } else if (settings.name == '/something-else') {
          //   return ...;
          // }
          // return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (ctx) => MainDashBoard(),
          );
        },
      ),
    );
  }
}
