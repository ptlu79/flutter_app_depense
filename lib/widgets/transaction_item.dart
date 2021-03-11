import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\€ ${transaction.amount}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('EEEE dd MMMM y')
              .format(transaction.date),
        ),
        // TO DO __________ LOCAL DATE !!!!!!!!!!!)
        trailing: 
          MediaQuery.of(context).size.width > 450
            ? TextButton.icon(
              icon: const Icon(Icons.delete_forever),
              label: const Text('Supprimer'),
              style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).errorColor)),
              onPressed:  () => deleteTx(transaction.id)
              )
            :IconButton(
              icon: const Icon(Icons.delete_forever),
              onPressed: () => deleteTx(transaction.id),
              color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
