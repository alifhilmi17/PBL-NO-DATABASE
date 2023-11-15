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
  int selectedPaymentOption = 0; // Default selected payment option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemesanan Billboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pembayaran:',
                      style: TextStyle(fontSize: 18),
                    ),
                    buildPaymentOptionRadio(1, 'COD'),
                    Text(
                      'Transfer Bank:',
                      style: TextStyle(fontSize: 18),
                    ),
                    buildPaymentOptionRadio(2, 'Jenis Pembayaran 1'),
                    buildPaymentOptionRadio(3, 'Jenis Pembayaran 2'),
                    buildPaymentOptionRadio(4, 'Jenis Pembayaran 3'),
                  ],
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Do something with booking data and selected payment option
                print(
                    'Billboard: ${widget.jenisBillboard}, Pesan Sekarang, Jenis Pembayaran: $selectedPaymentOption');
              },
              child: Text('Pesan Sekarang'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentOptionRadio(int value, String label) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: selectedPaymentOption,
          onChanged: (int? newValue) {
            setState(() {
              selectedPaymentOption = newValue!;
            });
          },
        ),
        Text(label),
      ],
    );
  }
}
