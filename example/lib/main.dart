import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glassmorphism ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.pink,
            ],
          ),
          // color: Colors.red,
        ),
        child: Center(
          child: Stack(
            children: [
              Container(
                child: Center(
                  child: Text(
                    "Glassmorphism",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
              Center(
                child: GlassContainer(
                  height: 200,
                  width: 200,
                  blur: 5,
                  opacity: 0.4,
                  color: Colors.white.withOpacity(0.3),
                  // gradient: LinearGradient(
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.bottomRight,
                  //   colors: [
                  //     Colors.white.withOpacity(0.2),
                  //     Colors.blue.withOpacity(0.3),
                  //   ],
                  // ),
                  border: Border.fromBorderSide(BorderSide.none),
                  // shadowStrength: 0,
                  // shadowColor: Colors.white.withOpacity(0.24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
