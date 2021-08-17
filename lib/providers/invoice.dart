import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import './product.dart';

class InvoiceLine {
  final int id;
  final int invId;
  final int productId;
  final String name;
  final double qty;
  final double price;
  final double lineAmount;

  InvoiceLine({
    this.id,
    this.invId,
    this.productId,
    this.name,
    this.qty,
    this.price,
    this.lineAmount,
  });
}

class Invoice {
  final int id;
  final String invoiceNo;
  final int partnerId;
  final DateTime dateTime;
  final List<InvoiceLine> lines;
  final double amount;

  Invoice({
    this.id,
    this.invoiceNo,
    this.partnerId,
    this.dateTime,
    this.lines,
    this.amount,
  });
}
