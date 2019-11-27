import 'package:flutter/material.dart';
import 'package:ff_contact_avatar/ff_contact_avatar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FFContactAvatar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            FFContactAvatar(
              name: 'Ed Roberts',
              message: 'He\'s a man',
              showBadge: true,
            ),
            SizedBox(height: 10),
            FFContactAvatar(
              name: 'Mr Ed',
              message: 'He\'s a horse',
              image: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/8/81/Mister_Ed.JPG'),
              showBadge: true,
            ),
          ],
        ),
      ),
    );
  }
}
