import 'package:flutter/material.dart';
import 'package:my_flutter_application1/model/custom_widget.dart';
import 'package:my_flutter_application1/model/grid.dart';
import 'package:my_flutter_application1/model/news_item.dart';
import 'package:my_flutter_application1/model/stack.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Latihan List and Grid",
      theme: ThemeData(useMaterial3: true),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  final List<NewsItem> listLatihan =[
    NewsItem(id: "1", title: "title 1", subtittle: "subtittle 1"),
    NewsItem(id: "2", title: "title 2", subtittle: "subtittle 2"),
  ];

  void onClick(String getId) {
    Fluttertoast.showToast(
      msg: "Item clicked: $getId",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.lightBlue,
      textColor: Colors.black,
      fontSize: 17.0
    );
  }

  void _onItemTapped(int index){
    switch (index) {
      case 0:
      //Handle List view tap
        break;
      case 1:
      Navigator.push(context, MaterialPageRoute(builder:(_)=>StackPage()));
        break;
      case 2:
       Navigator.push(context, MaterialPageRoute(builder:(_)=>GridViewPage()));
        break;
      case 3:
      Navigator.push(context, MaterialPageRoute(builder:(_)=>CustomWidgetPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan List and Grid"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(9),
        itemCount: listLatihan.length,
        itemBuilder: (context, index){
          final latihan = listLatihan[index];
          return Container(
            margin: EdgeInsets.all(9),
            padding: EdgeInsets.all(8),
            color: Colors.yellow,
            child: ListTile(
              leading: Icon(Icons.picture_as_pdf, color: Colors.red,),
              onTap: () => onClick(latihan.id),
              tileColor: Colors.brown,
              title: Text(latihan.title),
              subtitle: Text(latihan.subtittle),
              trailing: IconButton(
                icon: const Icon(Icons.info, color: Colors.blue,),
                onPressed:() => onClick(latihan.id)),
            ),
          );
        }
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: const[
        BottomNavigationBarItem(
          icon: Icon(Icons.list, color: Color(0xFF00000)), label: "List View"),
        BottomNavigationBarItem(
          icon: Icon(Icons.layers, color: Color(0xFF00000)), label: "Stack View"),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view, color: Color(0xFF00000)), label: "Grid View"),
        BottomNavigationBarItem(
          icon: Icon(Icons.widgets, color: Color(0xFF00000)), label: "Custom Widget"),
      ],
      onTap: _onItemTapped,
      ),
    );
  }
}