import 'package:flutter/foundation.dart';

class Partner {
   int id;
   String name;
   double openBal;
   double currBal;
   String contactNo;
   String details;

  Partner({
    @required this.id,
    @required this.name,
    @required this.openBal,
    @required this.currBal,
    this.contactNo,
    this.details,
  });
}
