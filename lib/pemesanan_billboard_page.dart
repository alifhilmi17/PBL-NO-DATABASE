import 'package:flutter/material.dart';

class PemesananBillboardPage extends StatefulWidget {
  final String jenisBillboard;
  final String catalogContent;
  final String imagePath;

  PemesananBillboardPage({
    required this.jenisBillboard,
    required this.catalogContent,
    required this.imagePath,
  });

  @override
  _PemesananBillboardPageState createState() => _PemesananBillboardPageState();
}

class _PemesananBillboardPageState extends State<PemesananBillboardPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemesanan Billboard'),
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
                print('Billboard: ${widget.jenisBillboard}, Jumlah: $quantity');
              },
              child: Text('Pesan Sekarang'),
            ),
          ],
        ),
      ),
    );
  }
}
