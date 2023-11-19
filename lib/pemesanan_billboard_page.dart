import 'package:flutter/material.dart';
import 'pembayaran_billboard_page.dart';

class PemesananBillboardPage extends StatefulWidget {
  final String jenisBillboard;
  final String catalogContent;
  final String imagePath;

  const PemesananBillboardPage({super.key, 
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
        title: const Text('Pemesanan Billboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: SizedBox(
                width: 400,
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        widget.imagePath,
                        width: 380,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 30.0),
                      child: Text(
                        widget.catalogContent,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pembayaran:',
                      style: TextStyle(fontSize: 18),
                    ),
                    buildPaymentOptionRadio(1, 'COD'),
                    const Text(
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
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: selectedPaymentOption != 0
                    ? () {
                        // Navigate to the payment page with the necessary data
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentPage(
                              jenisBillboard: widget.jenisBillboard,
                              selectedPaymentOption: selectedPaymentOption,
                              orderPrice: 'Rp.200.000',
                            ),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  minimumSize: Size(
                    MediaQuery.of(context).size.width,
                    0,
                  ),
                ),
                child: const Row(
                  children: [
                    Text(
                      'Pesan Sekarang',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Rp.200.000',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
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
