import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:flutter/widgets.dart';
//import '..models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTrans;
  TransactionList(this.transactions,this.deleteTrans);

//   final List<Transaction> _userTransactions = [
//     Transaction(
//       id: 't1',
//       title: 'Shoes',
//       amount: 23.65,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: 't2',
//       title: 'Groceries',
//       amount: 43.65,
//       date: DateTime.now(),
//     ),
//   ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('No transactions added yet',
                    style: Theme.of(context).textTheme.title),
                SizedBox(height: 10, width: 10),
                Container(
                    height: 400,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover)),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Container(
                  child: Card(
                    elevation: 5,
                    color: Colors.pink.shade50,
                    //border:Border.all(color:Colors.indigo,width:2.0),
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                        leading: CircleAvatar(
                          radius: 40,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: FittedBox(
                              child: Text('₹${transactions[index].amount}'),
                            ),
                          ),
                        ),
                        title: Text(
                          transactions[index].title,
                          style: Theme.of(context).textTheme.title,
                        ),
                        subtitle: Text(
                          //textColor: Colors.indigo,
                          DateFormat.yMMMd().format(transactions[index].date),
                        ),
                        trailing: IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                            onPressed:()=> deleteTrans(transactions[index].id),
                            )),
                  ),
                );
                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Theme.of(context).primaryColor,
                //             width: 2,
                //           ),
                //         ),
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //           '₹${transactions[index].amount.toStringAsFixed(2)}',
                //           //+transactions.amount.toString(),
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               color: Theme.of(context).primaryColor,
                //               fontSize: 20),
                //         ),
                //       ),
                //       Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: <Widget>[
                //             Text(transactions[index].title,
                //                 style: TextStyle(
                //                     fontWeight: FontWeight.bold,
                //                     color: Colors.blue.shade900,
                //                     fontSize: 16)),
                //             Text(DateFormat.yMMMMEEEEd().format(transactions[index].date),
                //                 style: TextStyle(
                //                     fontWeight: FontWeight.bold,
                //                     color: Colors.purpleAccent.shade700,
                //                     fontSize: 14))
                //           ])
                //     ],
                //   ),
                // );
              },
              itemCount: transactions.length,
              //children: transactions.map((transactions) {

              //TransactionList();
              //}).toList(),
            ),
    );
  }
}
