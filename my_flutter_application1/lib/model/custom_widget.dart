import 'package:flutter/material.dart';

class CustomWidgetPage extends StatelessWidget {
  const CustomWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Widget"),),
      body: ListView(
        padding: EdgeInsets.all(10),
      children: [
        InfoCard(icon: Icons.picture_as_pdf, title: "Judul Ke 1", subtittle: "subtitle Ke 1", color: Colors.black),
        SizedBox(height: 10,),
        InfoCard(icon: Icons.headphones, title: "Judul Ke 2", subtittle: "subtittle ke 2", color: Colors.blue
        ),
        SizedBox(height: 10,),
        InfoCard(icon: Icons.animation, title: "Judul Ke 3", subtittle: "subtittle ke 3", color: Colors.yellow),
        SizedBox(height: 10,),
        InfoCard(icon: Icons.airport_shuttle, title: "Bandara", subtittle: "Bandung", color: Colors.green),
      ],
      )
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtittle;
  final Color color;

  const InfoCard({
  super.key, 
  required this.icon, 
  required this.title, 
  required this.subtittle, 
  required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withAlpha(12),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(15),
      child: Row(children: [
        Icon(icon, color: color, size: 32,),
        SizedBox(width: 10,),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ), 
            Text(subtittle)
          ],
        )),
        IconButton(
          onPressed: (){
            ScaffoldMessenger.of(context,). showSnackBar(SnackBar(content: Text("Hapus $title")));
          } , 
        icon: Icon(Icons.delete_outlined)
        ),
      ],),
    );
  }
}