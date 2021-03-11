import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

class Transaction {
  @required final String id;
  @required final String title;
  @required final double amount;
  @required final DateTime date;

  Transaction({this.id, this.title, this.amount, this.date});
}
