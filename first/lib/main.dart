import 'package:flutter/material.dart';
//import 'package:flutter_complete_guide/result.dart';
import 'package:flutter/widgets.dart';
//import 'models/transaction.dart';
import 'package:intl/intl.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
// import 'package:flutter_complete_guide/widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transactions App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(fontFamily: 'RobotoSlab', fontSize: 18)),
        ),
        primarySwatch: Colors.indigo,
        accentColor: Colors.pink,
        fontFamily: 'RobotoSlab',
        //appBarTheme:
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [];
  // Transaction(
  //   id: 't1',
  //   title: 'Shoes',
  //   amount: 23.65,
  //   date: DateTime.now(),
  // ),
  // Transaction(
  //   id: 't2',
  //   title: 'Groceries',
  //   amount: 43.65,
  //   date: DateTime.now(),
  // ),

  // final titleController = TextEditingController();
  // final amountController = TextEditingController();

  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'Shoes',
    //   amount: 23.65,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Groceries',
    //   amount: 43.65,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((trans) {
      return trans.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransactions(
      String transacTitle, double transacAmount, DateTime chosenDate) {
    final newTransac = Transaction(
      title: transacTitle,
      amount: transacAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTransac);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransactions),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((trans) {
        return trans.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Transaction App', style: TextStyle(fontFamily: 'RobotoSlab')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
        //alignment: TextAlign.center,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            // Container(
            //   width: double.infinity,
            //   child: Card(
            //     color: Colors.teal.shade200,
            //     child: Container(
            //       width: double.infinity,
            //       child: Text('Chart'),
            //     ),
            //     elevation: 5,
            //   ),
            // ),
            //UserTransactions(),
            // NewTransaction(),
            TransactionList(_userTransactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
