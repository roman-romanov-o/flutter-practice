import 'package:flutter/material.dart';
import 'package:section_4_practice/models/transaction.dart';
import 'package:section_4_practice/widgets/add_transaction.dart';
import 'package:section_4_practice/widgets/transaction_list.dart';
import 'package:uuid/uuid.dart';


var uuid = Uuid();


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1',
        title: 'test 1',
        date: DateTime.now(),
        amount: 20.10
    ),
    Transaction(
        id: 't2',
        title: 'test 2',
        date: DateTime.now(),
        amount: 20.10
    ),
  ];

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) => AddNewTransaction(_addNewTransaction),
    );
  }

  void _addNewTransaction(String title, double amount) {
    setState(() {
      _userTransactions.add(Transaction(
        id: uuid.v1(),
        title: title,
        amount: amount,
        date: DateTime.now(),
      ));
    });
  }



  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello my friend!'),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Text('Some graph here'),
            ),
            Column(
              children: [
                TransactionList(_userTransactions),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(ctx),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
