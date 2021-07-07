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
            colors: [
              Colors.red,
              Colors.green,
            ],
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              GlassContainer(
                height: 200,
                width: 200,
                // blur: 1,
                // opacity: 0.2,
                // shadowStrength: 2,
                child: Center(
                  child: Text(
                    "Hello World",
                  ),
                ),
              ),
              Positioned(
                top: 25,
                left: 25,
                child: GlassContainer(
                  height: 50,
                  width: 50,
                  // blur: 1,
                  // opacity: 0.2,
                  // shadowStrength: 2,
                  // child: Center(),
                ),
              ),
              Positioned(
                top: 15,
                left: 15,
                child: GlassContainer(
                  height: 50,
                  width: 50,
                  blur: 1,
                  // opacity: 0.2,
                  // shadowStrength: 2,
                  // child: Center(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
