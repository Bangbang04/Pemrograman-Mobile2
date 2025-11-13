import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stack"),),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            color: Colors.blue[100],
          ),
          Container(
            width: 150,
            height: 100,
            color: Colors.lightBlue[100],
          ),
          Text(
            "Hello World",
            style: TextStyle(
              fontSize:20,
              color: Colors.black,
              fontWeight: FontWeight.bold 
            ),
          ),
          Positioned(
            right:10,
            bottom: 10,
            child: Icon(Icons.picture_as_pdf, size: 34, color: Colors.amber[200],)
            ,)
        ],
      ),
    );
  }
}