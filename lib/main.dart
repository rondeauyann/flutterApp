import 'package:epsi_chat/views/artist_page.dart';
import 'package:epsi_chat/views/login_page.dart';
import 'package:epsi_chat/views/register_page.dart';
import 'package:flutter/material.dart';

import 'views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Festival',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      routes: <String, WidgetBuilder>{
        '/register': (BuildContext context) => RegisterPage(),
        '/login': (BuildContext context) => LoginPage(),
        '/home': (BuildContext context) => HomePage(),
        '/artist': (BuildContext context) => ArtistPage(),

      },
      initialRoute: '/login',
    );
  }
}