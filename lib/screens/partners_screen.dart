import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/partner.dart';
import '../providers/partners.dart';
import '../widgets/app_drawer.dart';
import '../widgets/partner_item.dart';
import './edit_partner_screen.dart';



class PartnersScreen extends StatelessWidget {
  static const routeName = '/partners';


  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Partners>(context, listen: false).fetchAndSetPartnersRpc();
  }
  


  @override
  Widget build(BuildContext context) {
    final partnersData = Provider.of<Partners>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Partners'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditPartnerScreen.routeName);
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
              itemCount: partnersData.items.length,
              itemBuilder: (_, i) => Column(
                children: <Widget>[
                  PartnerItem(
                    partnersData.items[i].id,
                    partnersData.items[i].name,
                    partnersData.items[i].currBal,

                  ),
                ],
              )
          ),
        ),
      ),

    );
  }
}
