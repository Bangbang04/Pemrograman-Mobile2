import 'package:flutter/material.dart';

// Ketika pertama kali di jalankan flutter akan mengakses void main
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Makanan & Minuman',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // Tema terang (background putih)
      home: const HomePage(),
    );
  }
}

// Halaman utama aplikasi
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Latar belakang putih
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            // BAGIAN REKOMENDASI MENU
            Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.shade50, // Sedikit aksen oranye muda
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange, width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: const Text(
                      'Rekomendasi Menu',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  // Gambar utama dan tombol panah
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            // Gambar makanan utama (Nasi Goreng)
                            "https://images.unsplash.com/photo-1680674814945-7945d913319c?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=870https://images.unsplash.com/photo-1680674814945-7945d913319c?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=870",
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: CircleAvatar(
                          backgroundColor: Colors.orange,
                          child: Icon(Icons.chevron_right, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  // Deskripsi makanan
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Nasi Goreng Spesial",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Nasi, Telur, Ayam, Sayur",
                          style: TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Harga: Rp 25.000",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // BAGIAN MAKANAN FAVORIT
            MenuSection(
              title: "Makanan Favorit",
              images: [
                "https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=870", // Pizza
                "https://images.unsplash.com/photo-1600891964092-4316c288032e?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=870" // Steak
              ],
              names: [
                "Pizza ",
                "Beef Steak"
              ],
            ),

            // BAGIAN MINUMAN SEGAR
            MenuSection(
              title: "Minuman Segar",
              images: [
                "https://media.istockphoto.com/id/175022686/id/foto/jus-jeruk-segar-dalam-gelas-kaca-di-sebelah-irisan-jeruk.jpg?s=1024x1024&w=is&k=20&c=W-4ruSGfecjfBMrWyKrNFZSCJi-Duy98iLSSGbSvvV0=", // Es Jeruk
                "https://images.unsplash.com/photo-1681366074674-13850edc6d6c?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=870" // Kopi susu
              ],
              names: [
                "Es Jeruk",
                "Kopi Latte"
                
              ],
            ),

            // BAGIAN DESSERT
            MenuSection(
              title: "Dessert Manis",
              images: [
                "https://images.unsplash.com/photo-1560008581-09826d1de69e?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=444", // Ice Cream
                "https://media.istockphoto.com/id/2234919510/id/foto/pisang-goreng-madu-or-indonesian-honey-fried-banana.jpg?s=1024x1024&w=is&k=20&c=GnPhnFQ1rPSK2_d2-w53uvaBBUt8Fsuw3inLvwKctcg=" // Pisang goreng
              ],
              names: [
                "Ice Cream",
                "Pisang Goreng"
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk setiap section menu (makanan/minuman)
class MenuSection extends StatelessWidget {
  final String title; // Judul section
  final List<String> images; // List URL gambar menu
  final List<String> names; // List nama menu

  const MenuSection({
    super.key,
    required this.title,
    required this.images,
    required this.names,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, bottom: 8, top: 8, right: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Baris judul dan tombol "More"
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                const Text(
                  "More",
                  style: TextStyle(color: Colors.black54),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          // List gambar menu horizontal
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.12),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    border: Border.all(color: Colors.orange.shade100, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Gambar menu
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(7),
                            topRight: Radius.circular(7)),
                        child: Image.network(
                          images[index],
                          height: 110,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Nama menu
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 6),
                        child: Text(
                          names[index],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
