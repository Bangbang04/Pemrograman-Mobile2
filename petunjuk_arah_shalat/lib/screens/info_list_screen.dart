import 'package:flutter/material.dart';
import 'widgets/app_drawer.dart'; // Memastikan drawer tetap muncul pada halaman ini.

class InfoListScreen extends StatelessWidget {
  const InfoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data list informasi
    final List<Map<String, String>> infoList = [
      {"title": "Cara Wudhu", "description": "Panduan langkah-langkah wudhu."},
      {"title": "Tata Cara Shalat", "description": "Panduan lengkap tata cara shalat."},
      {"title": "Doa Harian", "description": "Kumpulan doa sehari-hari."},
      {"title": "Jadwal Shalat", "description": "Manfaatkan aplikasi untuk jadwal shalat."},
      {"title": "Arah Kiblat", "description": "Petunjuk menentukan arah kiblat."},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi Islam'),
      ),
      drawer: const AppDrawer(), // Menggunakan drawer untuk navigasi
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: infoList.length,
        itemBuilder: (context, index) {
          final info = infoList[index];
          return ListTile(
            leading: const Icon(Icons.info, color: Colors.blue),
            title: Text(info["title"] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(info["description"] ?? ''),
            onTap: () {
              // Tampilkan pesan ketika item dipilih.
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Anda memilih: ${info["title"]}')),
              );
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: Text(
          'Copyright by Bangbang Ramadhan - 23552011177',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}