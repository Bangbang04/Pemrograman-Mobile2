import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gridview"),),
      body: Center(
        child: GridView.count(
          primary: false,
          padding: EdgeInsets.all(9),
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              color: Colors.teal[100],
              child: Text("Grid Ke 1", style: TextStyle(fontSize: 18),),
            ),
             Container(
              padding: EdgeInsets.all(5),
              color: Colors.teal[200],
              child: Text("Grid Ke 2", style: TextStyle(fontSize: 18),),
            ),
           Container(
              padding: EdgeInsets.all(5),
              color: Colors.teal[300],
              child: Text("Grid Ke 3", style: TextStyle(fontSize: 18),),
            ),
           Container(
              padding: EdgeInsets.all(5),
              color: Colors.teal[400],
              child: Text("Grid Ke 4", style: TextStyle(fontSize: 18),),
            )
          ],
          ),
      ),
    );
  }
}