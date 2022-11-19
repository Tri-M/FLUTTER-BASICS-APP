import 'package:flutter/material.dart';
// import 'package:flutter_complete_guide/widgets/transaction_list.dart';
// import './widgets/new_transaction.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransac;
  NewTransaction(this.addTransac);
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime _selectedDate;

  void _SubmitData() {
    if(_amountController.text.isEmpty)
    {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate==null) {
      return;
    }

    widget.addTransac(enteredTitle, enteredAmount,_selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
      // _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: _titleController,
            onSubmitted: (_) => _SubmitData(),
            onChanged: (value) {
              //InputTitle = value;
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: _amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _SubmitData(),
            //onChanged: (value) {
            //InputAmount = value;}
          ),
          Container(
            height: 50,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(_selectedDate == null
                      ? 'No Date Chosen'
                      :  'Chosen Date : ${DateFormat.yMEd().format(_selectedDate)}'
                  ),
                ),
                FlatButton(
                  textColor: Colors.pink.shade700,
                  child: Text('Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onPressed: _presentDatePicker,
                ),
              ],
            ),
          ),
          RaisedButton(
            child: Text('Add Transaction'),
            color: Colors.indigo,
            textColor: Colors.white,
            onPressed: _SubmitData,
            // addTransac(_titleController.text,double.parse(_amountController.text)
            // );
            // print(InputTitle);
            // print(InputAmount);
            //print(_titleController.text);
          )
        ]),
      ),
    );
  }
}
