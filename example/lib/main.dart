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
              GlassImage(
                height: 200,
                width: 200,
                blur: 4,
                image: Image.network(
                  "link",
                  fit: BoxFit.cover,
                ),
                overlayColor: Colors.white.withOpacity(0.1),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.2),
                    Colors.blue.withOpacity(0.3),
                  ],
                ),
                border: Border.fromBorderSide(BorderSide.none),
                shadowStrength: 5,
                borderRadius: BorderRadius.circular(16),
                shadowColor: Colors.white.withOpacity(0.24),
              ),
              Image.network(
                "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
                fit: BoxFit.cover,
              ).blur(blur: 4),
              Blur(blur: 4, child: Text("Glassmorphism")),
              Image.network(
                "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
                fit: BoxFit.cover,
              ).blurClipped(blur: 4),
              Center(
                child: ClipRect(
                  child: BlurredImage(
                    image: Image.network(
                      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
