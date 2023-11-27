import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String mergedReversedText = '';

  void mergeAndReverse() {
    const text1 = 'CADALO';
    const text2 = 'CAILING';

    mergedReversedText = (text2 + text1).split('').reversed.join('');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Merge and Reverse',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue, // Set the background color to blue
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                mergeAndReverse();
              },
              child: Text('Merge and Reverse'),
            ),
            SizedBox(height: 20),
            Text('$mergedReversedText'),
          ],
        ),
      ),
    );
  }
}
