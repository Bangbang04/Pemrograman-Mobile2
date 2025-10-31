
void main() {
  try {
    int hasil = 10 ~/ 0;
    print(hasil);
  } catch (e) {
    print("terjadi kesalahan: $e");
  } finally {
    print ("Selesai mencoba operasi");
  }
}