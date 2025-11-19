import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'widgets/app_drawer.dart';
import 'widgets/app_footer.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  double? _qiblaDirection; // derajat dari utara searah jarum jam
  String _status = 'Mengambil lokasi…';

  @override
  void initState() {
    super.initState();
    _initQibla();
  }

  Future<void> _initQibla() async {
    try {
      // Cek dan minta izin lokasi
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        setState(() {
          _status = 'Izin lokasi ditolak. Aktifkan izin lokasi untuk melihat arah kiblat.';
        });
        return;
      }

      final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final lat = pos.latitude;
      final lon = pos.longitude;
      final bearing = _calculateQibla(lat, lon);

      setState(() {
        _qiblaDirection = bearing;
        _status = 'Lokasi: ${lat.toStringAsFixed(4)}, ${lon.toStringAsFixed(4)}';
      });
    } catch (e) {
      setState(() {
        _status = 'Gagal mendapatkan lokasi: $e';
      });
    }
  }

  // Rumus arah kiblat (great circle) dari titik (lat, lon) ke Ka'bah
  double _calculateQibla(double lat, double lon) {
    const kaabaLat = 21.4225;
    const kaabaLon = 39.8262;

    final phi1 = _degToRad(lat);
    final phi2 = _degToRad(kaabaLat);
    final dLon = _degToRad(kaabaLon - lon);

    final y = sin(dLon);
    final x = cos(phi1) * tan(phi2) - sin(phi1) * cos(dLon);

    var brng = atan2(y, x);
    brng = _radToDeg(brng);
    brng = (brng + 360) % 360;
    return brng;
  }

  double _degToRad(double deg) => deg * pi / 180.0;
  double _radToDeg(double rad) => rad * 180.0 / pi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arah Kiblat'),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _status,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    if (_qiblaDirection == null)
                      const CircularProgressIndicator()
                    else ...[
                      SizedBox(
                        width: 230,
                        height: 230,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Lingkaran kompas
                            Container(
                              width: 220,
                              height: 220,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 4,
                                ),
                              ),
                            ),
                            // Huruf N (North)
                            const Positioned(
                              top: 8,
                              child: Text(
                                'N',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // Panah menunjuk kiblat
                            Transform.rotate(
                              angle: _qiblaDirection! * pi / 180,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.arrow_upward,
                                      size: 60, color: Colors.red),
                                  SizedBox(height: 8),
                                  Text('Kiblat'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Arah kiblat: ${_qiblaDirection!.toStringAsFixed(1)}° dari utara.',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          const AppFooter(), // copyright di bawah
        ],
      ),
    );
  }
}