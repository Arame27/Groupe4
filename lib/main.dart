import 'package:clonenetflix/UI/screens/home_screen.dart';
import 'package:clonenetflix/UI/screens/loading_screen.dart';
import 'package:clonenetflix/repositories/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create : ((context)=>DataRepository()),
    child : const MyApp(),
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Netflix',
      theme: ThemeData(),
      home:  LoadingScreen(),
    );
  }
}

