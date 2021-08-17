import 'package:flutter/foundation.dart';

class Product {
  //final String id;
  final int id;
  final String name;
  final double price;
  final String description;

  Product({
    @required this.id,
    @required this.name,
    @required this.price,
    this.description,
  });
}
