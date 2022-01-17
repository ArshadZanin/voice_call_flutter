import 'package:flutter/material.dart';
import 'package:voice_chat_flutter/home_page.dart';

const appId = '49e5499cc23247949224b4bbd9bdb201';
const Token = '00649e5499cc23247949224b4bbd9bdb201IABz9kaV/sYuFeTOrxc/55kaw53Xo9cp3WZaezDuOfoHEtJjSIgAAAAAEABLPQ3J0F3mYQEAAQDQXeZh';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomePage(),
    );
  }
}
