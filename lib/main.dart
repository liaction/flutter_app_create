
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          'Flutter Create',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _random = math.Random();
  SystemUiOverlayStyle _currentStyle = SystemUiOverlayStyle.light;

  void _changeColor() {
    final color = Color.fromRGBO(
      _random.nextInt(255),
      _random.nextInt(255),
      _random.nextInt(255),
      1.0,
    );
    setState(() {
      _currentStyle = SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: color,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: _currentStyle,
        child: Center(
          child: RaisedButton(
            child: const Text('Change Color'),
            onPressed: _changeColor,
          ),
        ),
      ),
    );
  }
}
