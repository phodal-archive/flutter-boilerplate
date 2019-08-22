import 'dart:io';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpExamplePage extends StatefulWidget {
  HttpExamplePage({Key key, this.title,}) : super(key: key);
  final String title;

  @override
  _HttpExamplePageState createState() => new _HttpExamplePageState();
}

class _HttpExamplePageState extends State<HttpExamplePage> {
  var _ipAddress = 'Unknown';

  _getIPAddress() async {
    var url = 'https://httpbin.org/ip';
    developer.log('log me', name: 'moPass');

    String result;
    try {
      Response response = await Dio().get(url);

      if (response.statusCode == HttpStatus.ok) {
        result = response.data.toString();
      } else {
        result = 'Error getting IP address:\nHttp status ${response.statusCode}';
      }

    } catch (exception) {
      developer.log('Failed getting IP address', name: 'moPass');
      result = 'Failed getting IP address';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _ipAddress = result;
    });
  }


  @override
  bool get mounted {
    developer.log('mounted');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(height: 32.0);

    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Your current IP address is:'),
            new Text('$_ipAddress.'),
            spacer,
            new RaisedButton(
              onPressed: _getIPAddress,
              child: new Text('Get IP address'),
            ),
          ],
        ),
      ),
    );
  }
}