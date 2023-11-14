import 'package:flutter/material.dart';

class PemesananKendaraanPage extends StatefulWidget {
  final String jenisKendaraan;
  final String catalogContent;
  final String imagePath;

  PemesananKendaraanPage({
    required this.jenisKendaraan,
    required this.catalogContent,
    required this.imagePath,
  });

  @override
  _PemesananKendaraanPageState createState() => _PemesananKendaraanPageState();
}

class _PemesananKendaraanPageState extends State<PemesananKendaraanPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemesanan Kendaraan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.imagePath,
              width: 300,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              widget.catalogContent,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Jumlah:',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) {
                        quantity--;
                      }
                    });
                  },
                ),
                Text(
                  quantity.toString(),
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Do something with booking data
                print(
                    'Jenis Kendaraan: ${widget.jenisKendaraan}, Jumlah: $quantity');
              },
              child: Text('Pesan Sekarang'),
            ),
          ],
        ),
      ),
    );
  }
}
