import 'package:flutter/material.dart';
import 'package:flutter_estudo_01/pages/pageGestores.dart';
import 'package:flutter_estudo_01/pages/postsHome.dart';

void main()  => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.green[800]
      ),
      //home: PostHome(),

      initialRoute: '/',
      routes: {
        '/':  (context) => postsHome(),
        '/noticias':  (context) => postsHome(),
        '/gestores': (context) => GestoresPage(),

      },
    );
  }

}