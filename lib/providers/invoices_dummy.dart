import 'package:flutter/foundation.dart';

import './invoice.dart';

class Invoices with ChangeNotifier {

    List <InvoiceLine> _loadedInvLines = [];
    Invoice _loadedInv = null;
    List <Invoice> _allInvoices = [];



}