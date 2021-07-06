# glassmorphism_ui 

Create glassmorphic design using GlassContainer having frosted glass effect.

## Getting Started

Create beautiful glassmorphic designs using this package,GlassContainer Widget provided by this package is completely customizable,change Container's opacity,blur,border,radius etc.


![alt text](./lib/glass.jpg)

## Installation 

Add this in to your pubspec.yaml

```bash
  dependencies:
  glassmorphism_ui: ^0.1.0
```

Go to the project directory and run

```bash
  flutter pub get
```

Import it

```bash
  import 'package:glassmorphism_ui/glassmorphism_ui.dart';
```

## GlassContainer example
```
GlassContainer(
      height: 130,
      blur: 3,
      shadowStrength: 10,
      opacity: 0.2,
      width: 230,
      //this below code to remove border
      border: Border.fromBorderSide(BorderSide.none),
      borderRadius: BorderRadius.circular(10),
      child: Center(child: Text("Glass Container"),),
),
```




