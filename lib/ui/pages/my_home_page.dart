import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.index}) : super(key: key);
  final String title;
  final String index;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController listNameController = new TextEditingController();

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('跳转到 ProfilePage'),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            RaisedButton(
              child: Text('跳转到 Camera'),
              onPressed: () {
                Navigator.pushNamed(context, '/camera');
              },
            ),
            new Padding(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Text('You have pushed the button this many times:',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                )),
            new TextFormField(
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                  labelText: "List name",
                  contentPadding: EdgeInsets.only(
                      left: 16.0, top: 20.0, right: 16.0, bottom: 5.0)),
              controller: listNameController,
              autofocus: false,
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              maxLength: 20,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
