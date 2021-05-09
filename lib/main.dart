import 'package:curriculum/pages/home_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CV Fidel García Barajas",
      home: HomePage()
    );
  }
}
