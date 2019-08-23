import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moPass/ui/pages/http_example_page.dart';

import 'package:moPass/ui/pages/my_home_page.dart';
import 'package:moPass/ui/pages/profile_page.dart';
import 'package:moPass/ui/screen/take_picture_screen.dart';

Future<void> main() async {
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;
  runApp(MyApp(firstCamera: firstCamera,));
}

class MyApp extends StatefulWidget {
  MyApp({Key key, this.firstCamera}) : super(key: key);
  final CameraDescription firstCamera;

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'moPass',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/profile': (context) => ProfilePage(title: 'Home -> Profile'),
        '/camera': (context) => TakePictureScreen(
          camera: widget.firstCamera,
        ),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 1;

  final List<Widget> _children = [
    MyHomePage(title: 'Home Page', index: '1'),
    HttpExamplePage(title: 'HTTP Example Page'),
    ProfilePage(title: 'Profile Page')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        fixedColor: Colors.deepPurple,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.calendarCheck),
              title: new Text("Home")),
          BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.calendar),
              title: new Text("Clean")),
          BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.slidersH),
              title: new Text("Profile"))
        ],
      ),
      body: _children[_currentIndex],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
