import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../qibla_screen.dart';
import '../info_list_screen.dart';
import '../login_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    Navigator.pop(context); // Tutup drawer

    // Bersihkan data login
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    if (!context.mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.explore, size: 80, color: Colors.white),
                SizedBox(height: 10),
                Text(
                  'Petunjuk Arah Shalat',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.explore),
            title: const Text('Arah Kiblat'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const QiblaScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Informasi Islam'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const InfoListScreen(),
                ),
              );
            },
          ),
          const Spacer(),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () => _handleLogout(context),
          ),
        ],
      ),
    );
  }
}