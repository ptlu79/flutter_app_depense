import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleContoller = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleContoller.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle.toString(),
      enteredAmount,
      _selectedDate,
    );

    // fermer la modal à la fin de submitData
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((dateValue) {
      if (dateValue == null) {
        return;
      }
      setState(() {
        _selectedDate = dateValue;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
              left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              // *********** TITRE DE LA DEPENSE ? ************
              TextField(
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                  labelText: 'titre de la dépense ?',
                ),
                // onChanged: (value) { titleInput = value; print(titleInput); },
                controller: _titleContoller,
                onSubmitted: (_) =>
                    _submitData(), // convention veux dire (val) => submitData(),
              ),
              // *********** MONTANT ? ************
              TextField(
                cursorColor: Colors.purple,
                decoration: InputDecoration(labelText: 'Montant ?'),
                // onChanged: (value) { amountInput = value; print(amountInput); },
                controller: _amountController,
                keyboardType: TextInputType
                    .number, // defini lors de la selection de l'input de l'utilisateur
                // keyboardType: TextInputType.numberWithOptions(decimal: true), // pour IOS sinon marche pas
                onSubmitted: (_) =>
                    _submitData(), // convention veux dire (val) => submitData(),
              ),
              // *********** DATE ? ************
              Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'Choisr une date  ?'
                          : '${DateFormat('EEEE dd MMMM y').format(_selectedDate)}',
                    ),
                    IconButton(
                      onPressed: () {
                        _presentDatePicker();
                      },
                      padding: EdgeInsets.only(right: 60),
                      icon: Icon(
                        Icons.calendar_today_rounded,
                        size: 40,
                      ),
                      tooltip: 'ouvrir le calendrier',
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              // *********** VALIDATION ************
              Platform.isIOS
                  ? CupertinoButton(
                      child: Text(
                        'Valider',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: _submitData)
                  : Center(
                      child: ElevatedButton(
                        onPressed: _submitData,
                        child: Text(
                          'Valider',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
