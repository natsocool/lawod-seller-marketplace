import 'package:flutter/material.dart';
import 'fisherfolkRegistration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fisherfolk Account',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Proxima Nova',
      ),
      home: JustButton(),
    );
  }
}

class JustButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Just a Button'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => FisherfolkRegistration()),
            );            print('Button Pressed');
          },
          child: Text('Press Me'),
        ),
      ),
    );
  }
}
