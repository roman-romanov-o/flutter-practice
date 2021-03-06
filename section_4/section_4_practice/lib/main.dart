import 'package:flutter/material.dart';
import 'package:section_4_practice/widgets/chart.dart';
import 'models/transaction.dart';
import 'package:section_4_practice/widgets/transaction_list.dart';
import 'package:section_4_practice/models/transaction.dart';
import 'package:section_4_practice/widgets/add_transaction.dart';
import 'package:uuid/uuid.dart';


void main() {
  runApp(MyApp());
}

var uuid = Uuid();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Expenses',
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
        primarySwatch: Colors.green,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true
        )
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
  final List<Transaction> transactions = [
    // Transaction(
    //     id: 'test1',
    //     title: 'Test 1',
    //     date: DateTime.now().subtract(Duration(days: 1)),
    //     amount: 25.00
    // ),
    // Transaction(
    //     id: 'test1',
    //     title: 'Test 1',
    //     date: DateTime.now().subtract(Duration(days: 2)),
    //     amount: 25.00
    // ),
    // Transaction(
    //     id: 'test1',
    //     title: 'Test 1',
    //     date: DateTime.now().subtract(Duration(days: 2)),
    //     amount: 25.00
    // ),
    // Transaction(
    //     id: 'test1',
    //     title: 'Test 1',
    //     date: DateTime.now().subtract(Duration(days: 3)),
    //     amount: 25.00
    // ),
  ];
  final int recentTransactionsDays = 7;

  get recentTransactions {
    var startFromDate = DateTime.now().subtract(
        Duration(days: recentTransactionsDays)
    );
    return transactions.where(
      (element) => element.date.isAfter(startFromDate)
    ).toList();
  }


  void addTransaction(String title, double amount, DateTime date) {
    setState(() {
      transactions.add(
          Transaction(
              id: uuid.v1(),
              title: title,
              amount: amount,
              date: date,
          )
      );
    });
  }

  void deleteTransaction(String transactionId) {
    setState(() {
      transactions.removeWhere((element) => element.id == transactionId);
    });
  }

  void startAddTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builderContext) => AddTransaction(addTransaction)
    );
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text('My Expenses',),
      actions: [
        IconButton(onPressed: () => startAddTransaction(context), icon: Icon(Icons.add))
      ],
    );

    var media = MediaQuery.of(context);
    double availableHeight = (
        media.size.height -
        appBar.preferredSize.height -
        media.padding.top -
        media.padding.bottom
    );

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Container(
                  height: availableHeight * 0.3,
                  child: Chart(recentTransactions)
              ),
              Container(
                  height: availableHeight * 0.7,
                  child: TransactionList(transactions, deleteTransaction)
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => startAddTransaction(context),
          child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
