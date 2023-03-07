// import 'dart:js_util';
//
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class NewTransaction extends StatefulWidget {
//   final Function addTx;
//
//   const NewTransaction(this.addTx, {Key? key}) : super(key: key);
//
//   @override
// // ignore: library_private_types_in_public_api
//   _NewTransactionState createState() => _NewTransactionState();
// }
//
// class _NewTransactionState extends State<NewTransaction> {
//   final _titleController = TextEditingController();
//   final _amountController = TextEditingController();
//   late DateTime _selectedDate;
//
//   void _submitData() {
//     if (_amountController.text.isEmpty) {
//       return;
//     }
//     final enteredTitle = _titleController.text;
//     final enteredAmount = double.parse(_amountController.text);
//
//     // ignore: unrelated_type_equality_checks
//     if (enteredTitle.isEmpty ||
//         enteredAmount <= 0 ||
//         // ignore: unrelated_type_equality_checks
//         _selectedDate == NullRejectionException) {
//       return;
//     }
//
//     widget.addTx(
//       enteredTitle,
//       enteredAmount,
//       _selectedDate,
//     );
//
//     Navigator.of(context).pop();
//   }
//
//   void _presentDatePicker() {
//     showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2019),
//       lastDate: DateTime(2022),
//     ).then((pickedDate) {
//       if (pickedDate == null) {
//         return;
//       }
//       setState(() {
//         _selectedDate = pickedDate;
//       });
//     });
//     // ignore: avoid_print
//     print('...');
//   }
//
//   @override
//
// // widget tree for the card starts hear
// // this is the element which appear on
// // tap of the floating action button
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: <Widget>[
//           TextField(
//             decoration: const InputDecoration(labelText: 'Title'),
//             controller: _titleController,
//             onSubmitted: (_) => _submitData(),
//           ),
//
//           //TextField
//           TextField(
//             decoration: const InputDecoration(labelText: 'Amount'),
//             controller: _amountController,
//             keyboardType: TextInputType.number,
//             onSubmitted: (_) => _submitData(),
//           ),
//           SizedBox(
//             height: 70,
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: Text(
//                     // ignore: unrelated_type_equality_checks
//                     _selectedDate == NullRejectionException
//                         ? 'No Date Chosen!'
//                         : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
//                   ), //Text
//                 ), //Expand
//                 TextButton(
//                   onPressed: _presentDatePicker,
//                   child: Container(
//                     color: Colors.green,
//                     child: const Text(
//                       'Choose Date',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//
//                 // FlatButton is deprecates and should not be used
//                 // instead we can use TextButton to achieve the same result
//
//                 // FlatButton(
//                 // textColor: Theme.of(context).primaryColor, //Text
//                 // onPressed: _presentDatePicker,
//                 // child: const Text(
//                 //	 'Choose Date',
//                 //	 style: TextStyle(
//                 //	 fontWeight: FontWeight.bold,
//                 //	 ), //TextStyle
//                 // ),
//                 // ), //FlatButton
//               ], //<Widget>[]
//             ), //Row
//           ), //Container
//
//           ElevatedButton(
//             onPressed: _submitData,
//             style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Colors.green)),
//             child: Text(
//               'Add Transaction',
//               style:
//               TextStyle(color: Theme.of(context).textTheme.button!.color),
//             ),
//           ),
//
//           // RaisedButton is deprecates and should not be used
//           // instead we can use ElevatedButton to achieve the same result
//
//           // RaisedButton(
//           // child: const Text('Add Transaction'),
//           // color: Theme.of(context).primaryColor,
//           // textColor: Theme.of(context).textTheme.button!.color,
//           // onPressed: _submitData,
//           // ), //RaisedButton
//         ], //<Widget>[]
//       ), //Column
//     ); //Card
//
//   }
// }
