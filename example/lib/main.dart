import 'package:flutter/material.dart';
import 'package:ff_contact_avatar/ff_contact_avatar.dart';

import 'package:english_words/english_words.dart';

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
      home: MyHomePage(title: 'FFContactAvatar Demo'),
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
  // Models is a short, manually created set of data, used to demonstrate
  // a ListView WITHOUT a ListView.builder
  final List<FFContactAvatarModel> models = [
    FFContactAvatarModel(
      name: 'Ed Roberts',
      message: 'He\s a man',
      showBadge: true,
    ),
    FFContactAvatarModel(
      name: 'Mr Ed',
      message: 'He\s a horse',
      showBadge: false,
      image: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/8/81/Mister_Ed.JPG'),
    ),
    FFContactAvatarModel(
      name: 'Mrs Roberts',
      message: 'Ed\'s Wife',
    ),
    FFContactAvatarModel(
      name: 'Mrs Horse',
      message: 'Also Ed\'s Wife',
      showBadge: true,
    ),
  ];

  // longList is populated with random data, used to demonstrate use WITH a ListView.builder
  final List<FFContactAvatarModel> longList = [];

  @override
  Widget build(BuildContext context) {
    // Create a 200 long list of data using random word pairs
    generateWordPairs().take(200).forEach((pair) {
      longList.add(
        FFContactAvatarModel(
          name: pair.first + ' ' + pair.second,
          message: generateWordPairs().take(1).first.join(' '),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // --------- SECTION 1
            // Manually output 2 x avatars
            Text('Sample using Individual Avatars'),
            FFContactAvatar(
              name: 'Ed Roberts',
              message: 'He\'s a man',
              showBadge: true,
              theme: FFContactAvatarTheme(
                backgroundColor: Colors.blueAccent,
                avatarElevation: 20.0,
              ),
            ),
            SizedBox(height: 10),
            FFContactAvatar(
              name: 'Mr Ed',
              message: 'He\'s a horse',
              image: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/8/81/Mister_Ed.JPG'),
              showBadge: true,
            ),
            SizedBox(
              height: 1,
              child: Container(
                color: Colors.grey,
              ),
            ),
            // --------------- SECTION 2
            // Output a ListView using the manual data set (NO builder)
            Text('Sample using full ListView'),
            Expanded(
              child: FFContactAvatarList.fromModelList(
                models,
                scrollDirection: Axis.horizontal,
                onSelectAvatar: (index) {
                  print('Index ' + index.toString() + ' selected.');
                },
              ),
            ),
            SizedBox(
              height: 1,
              child: Container(
                color: Colors.grey,
              ),
            ),
            // --------------- SECTION 3
            // Output a ListView using the .builder approach (using long list of generated data)
            Text('Sample using ListView.Builder'),
            Expanded(
              child: FFContactAvatarList.fromModelListWithBuilder(
                longList,
                context: context,
                scrollDirection: Axis.horizontal,
                onSelectAvatar: (index) {
                  print('Index ' + index.toString() + ' selected.');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
