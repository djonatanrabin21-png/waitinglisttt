import 'dart:io';

void main() {
  var jalan = true;

  Map posA = {'plat': null};
  Map posB = {'plat': null};
  Map posC = {'plat': null};

  List waitinglist = [];

  void tampilmenu() {
    print('\n==============================');
    print('   SISTEM ANTRIAN CUCI MOBIL');
    print('==============================');
    print('1. Tambah mobil');
    print('2. Lihat waiting list');
    print('3. Lihat pos');
    print('4. Selesaikan pos');
    print('5. Keluar');
    print('==============================');
  }

  void tambahlist() {
    stdout.write('Masukkan nomor plat mobil: ');
    var plat = stdin.readLineSync();

    if (plat == null || plat.isEmpty) {
      print('Nomor plat tidak boleh kosong!');
      return;
    }

    // Cek Pos A
    if (posA['plat'] == null) {
      posA['plat'] = plat;
      print('Mobil $plat masuk ke Pos A.');
    }
    // Kalau A penuh, cek Pos B
    else if (posB['plat'] == null) {
      posB['plat'] = plat;
      print('Mobil $plat masuk ke Pos B.');
    }
    // Kalau A dan B penuh, cek Pos C
    else if (posC['plat'] == null) {
      posC['plat'] = plat;
      print('Mobil $plat masuk ke Pos C.');
    }
    // Kalau semua pos penuh
    else {
      waitinglist.add(plat);
      print('Semua pos penuh.');
      print('Mobil $plat masuk ke waiting list.');
    }
  }

  void lihatlist() {
    print('\n===== WAITING LIST =====');

    if (waitinglist.isEmpty) {
      print('Waiting list kosong.');
    } else {
      for (var i = 0; i < waitinglist.length; i++) {
        print('${i + 1}. ${waitinglist[i]}');
      }
    }
  }

  void lihatpos() {
    print('\n===== KONDISI POS =====');

    if (posA['plat'] == null) {
      print('Pos A : Kosong');
    } else {
      print('Pos A : ${posA['plat']}');
    }

    if (posB['plat'] == null) {
      print('Pos B : Kosong');
    } else {
      print('Pos B : ${posB['plat']}');
    }

    if (posC['plat'] == null) {
      print('Pos C : Kosong');
    } else {
      print('Pos C : ${posC['plat']}');
    }
  }

  void selesaipost() {
    print('\n===== SELESAI CUCI MOBIL =====');
    print('1. Pos A');
    print('2. Pos B');
    print('3. Pos C');

    stdout.write('Pilih pos yang selesai: ');
    var pilihan = stdin.readLineSync();

    Map? pos;

    // Menentukan pos yang dipilih
    switch (pilihan) {
      case '1':
        pos = posA;
        break;

      case '2':
        pos = posB;
        break;

      case '3':
        pos = posC;
        break;

      default:
        print('Pilihan pos tidak tersedia.');
        return;
    }

    // Cek apakah pos berisi mobil
    if (pos['plat'] == null) {
      print('Pos tersebut sedang kosong.');
      return;
    }

    print('Mobil ${pos['plat']} selesai dicuci.');

    // Kosongkan pos
    pos['plat'] = null;

    // Cek waiting list
    if (waitinglist.isNotEmpty) {
      var mobilBerikutnya = waitinglist.removeAt(0);

      pos['plat'] = mobilBerikutnya;

      print('Mobil $mobilBerikutnya masuk ke pos tersebut.');
    } else {
      print('Tidak ada mobil di waiting list.');
      print('Pos sekarang kosong.');
    }
  }

  void keluarapp() {
    print('\nTerima kasih telah menggunakan sistem.');
    exit(0);
  }

  while (jalan == true) {
    tampilmenu();

    stdout.write('Pilih menu: ');
    var pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        tambahlist();
        break;

      case '2':
        lihatlist();
        break;

      case '3':
        lihatpos();
        break;

      case '4':
        selesaipost();
        break;

      case '5':
        keluarapp();
        break;

      default:
        print('Pilihan tidak tersedia.');
    }
  }
}
