import 'package:cartflutter/Screens/cart.dart';
import 'package:cartflutter/Screens/home.dart';
import 'package:cartflutter/provider/mycart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyCart>(
          create: (context) => MyCart(),
        ),
        ChangeNotifierProvider<PageProv>(
          create: (context) => PageProv(),
        )
      ],
      child: MaterialApp(
        routes: {'/': (context) => Home(), '/cart': (context) => Cart()},
        initialRoute: '/',
      ),
    );
  }
}
