import 'package:flutter/material.dart';

class PemesananKendaraanPage extends StatefulWidget {
  final String jenisKendaraan;
  final String catalogContent;
  final String imagePath;

  const PemesananKendaraanPage({super.key, 
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
        title: const Text('Pemesanan Kendaraan'),
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
            const SizedBox(height: 20),
            Text(
              widget.catalogContent,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Jumlah:',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
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
                  style: const TextStyle(fontSize: 18),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Do something with booking data
                print(
                    'Jenis Kendaraan: ${widget.jenisKendaraan}, Jumlah: $quantity');
              },
              child: const Text('Pesan Sekarang'),
            ),
          ],
        ),
      ),
    );
  }
}
