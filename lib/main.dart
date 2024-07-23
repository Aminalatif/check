// import 'package:flutter/material.dart';
// import 'package:food/views/home.dart';
// import 'package:food/views/starting_page.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Foodie Moodie Recipes',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home:  StartingPage(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:food/views/home.dart';
import 'package:food/views/starting_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => StartingPage(),
        '/home': (context) => Home(),
      },
    );
  }
}
