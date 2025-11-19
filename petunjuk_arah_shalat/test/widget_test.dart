import 'package:flutter_test/flutter_test.dart';
import 'package:petunjuk_arah_shalat/main.dart';

void main() {
  testWidgets('App title appears', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Tunggu semua animasi/timer selesai (misal SplashScreen ada timer 3 detik)
    await tester.pump(const Duration(seconds: 4)); // lebih dari delay splash

    // Cek apakah judul aplikasi muncul
    expect(find.text('Petunjuk Arah Shalat'), findsOneWidget);
  });
}