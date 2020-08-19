import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.redAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  var _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'The number on Statless Widget can not be change even we clcik to add button.\n',
                  style: TextStyle(fontSize: 21),
                ),
              ),
            ),
            Center(
              child: Text(
                '$_count',
                style: TextStyle(fontSize: 32),
              ),
            ),
            RaisedButton(
              child: Text('Next Screen'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopCartScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _count++;
          print('[Count is:] $_count');
        },
      ),
    );
  }
}

class ShopCartScreen extends StatefulWidget {
  ShopCartScreen({Key key}) : super(key: key);

  @override
  _ShopCartScreenState createState() => _ShopCartScreenState();
}

class _ShopCartScreenState extends State<ShopCartScreen> {
  var _data = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop Cart Screen'),
        actions: [
          Row(
            children: [
              CircleAvatar(
                child: Text('$_data'),
              ),
              Icon(Icons.shopping_cart),
            ],
          ),
        ],
      ),
      drawer: Drawer(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Text('$_data'),
                ),
                Icon(Icons.shopping_cart),
              ],
            ),
            RaisedButton(
              child: Text('Next Screen'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowDataScreen(
                      data: _data,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _data++;
            });
          }),
    );
  }
}

class ShowDataScreen extends StatelessWidget {
  final int data;
  const ShowDataScreen({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Data'),
      ),
      body: Center(
        child: Text(
          '$data',
          style: TextStyle(fontSize: 42),
        ),
      ),
    );
  }
}
