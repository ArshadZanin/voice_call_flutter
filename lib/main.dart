import 'package:flutter/material.dart';
import 'package:voice_chat_flutter/home_page.dart';

const appId = '49e5499cc23247949224b4bbd9bdb201';
const Token = '00649e5499cc23247949224b4bbd9bdb201IAA/g5kogtVafJWzXk7zXYkWpkuoGMsIDQiCWgI0i0sJc9JjSIgAAAAAEABLPQ3JZkfmYQEAAQBmR+Zh';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomePage(),
    );
  }
}
