import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    // ****************** CARDS ************************
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, contraint) {
            return Column(
              children: <Widget>[
                Text('Aucne dépense enregistré'
                    // style: Theme.of(context).textTheme.title,
                    ),
                Container(
                    height: contraint.maxHeight * 0.6,
                    margin: EdgeInsets.only(top: 20),
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
        : ListView.builder(
            // scrollabe prends toujours a wrappeur (qui definie la hauteur) sinon erreur car il est toujours a l'infini
            itemBuilder: (ctx, index) {
              return TransactionItem(transaction: transactions[index], deleteTx: deleteTx);

              //   Card(
              //     elevation: 5,
              //     margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              //     color: Theme.of(context).secondaryHeaderColor,
              //     child: Row(children: <Widget>[
              //       // ****************** AMOUNT CARD ************************
              //       Container(
              //         margin:
              //             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              //         padding: EdgeInsets.all(5),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Theme.of(context).primaryColor,
              //             width: 2,
              //           ),
              //           // color: Theme.of(context).secondaryHeaderColor,
              //         ),
              //         child: FittedBox(
              //           child: Text(
              //             '\€ ${transactions[index].amount.toStringAsFixed(2)}', // __ TO DO __________________________________ LOCAL MONEY !!!!!!!!!!!

              //             // tx.amount.toString(),
              //             style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 20,
              //               color: Theme.of(context).primaryColor,
              //             ),
              //           ),
              //         ),
              //       ),
              //       // ****************** TITLE & DATE CARD ************************
              //       Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: <Widget>[
              //             Text(
              //               transactions[index].title,
              //               style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 16,
              //                 color: Theme.of(context).primaryColor,
              //               ),
              //             ),
              //             Text(
              //               DateFormat('EEEE dd MMMM y').format(transactions[
              //                       index]
              //                   .date), // TO DO _________________________________________ LOCAL DATE !!!!!!!!!!!
              //               style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 12,
              //                 color: Colors.grey,
              //               ),
              //             ),
              //           ]),
              //     ]),
              //   );
            },
            itemCount: transactions
                .length, // indique le nombre d'elements à construire

// SANS LE LISTVIEW BUILDER ********************************
            // children: transactions.map((tx) {
            // return
            //   Card(
            //     elevation: 5,
            //     margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
            //     color: Colors.orange.shade100,
            //     child: Row(children: <Widget>[
            //       // ****************** AMOUNT CARD ************************
            //       Container(
            //         margin:
            //             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //         padding: EdgeInsets.all(5),
            //         decoration: BoxDecoration(
            //           border: Border.all(
            //             color: Colors.purple,
            //             width: 3,
            //           ),
            //           color: Colors.transparent,
            //         ),
            //         child: Text(
            //           '\€ ${tx.amount}', // __ TO DO __________________________________ LOCAL MONEY !!!!!!!!!!!

            //           // tx.amount.toString(),
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontSize: 20,
            //             color: Colors.purple,
            //           ),
            //         ),
            //       ),
            //       // ****************** TITLE & DATE CARD ************************
            //       Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: <Widget>[
            //             Text(
            //               tx.title,
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 16,
            //                   color: Colors.purple.shade700),
            //             ),
            //             Text(
            //               DateFormat('EEEE dd MMMM y').format(tx
            //                   .date), // TO DO _________________________________________ LOCAL DATE !!!!!!!!!!!
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 12,
            //                   color: Colors.grey),
            //             ),
            //           ]),
            //     ]),
            //   );
            // }).toList(),
          );
  }
}

