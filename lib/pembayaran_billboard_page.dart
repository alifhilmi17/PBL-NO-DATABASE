import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import paket intl untuk format tanggal

class PaymentPage extends StatelessWidget {
  final String jenisBillboard;
  final int selectedPaymentOption;
  final String orderPrice;
  final String orderCode; // Kode pemesanan

  PaymentPage({super.key, 
    required this.jenisBillboard,
    required this.selectedPaymentOption,
    required this.orderPrice,
  }) : orderCode = generateOrderCode(
          jenisBillboard,
        ); // Panggil fungsi untuk menghasilkan kode pemesanan

  // Fungsi untuk menghasilkan kode pemesanan
  static String generateOrderCode(String jenisBillboard) {
    // Contoh: Billboard_TYPE_20230201_123456
    return 'Billboard_${jenisBillboard}_${DateFormat('yyyyMMdd_HHmmss').format(DateTime.now())}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Pembayaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    'Kode Pemesanan:',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    orderCode,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            'Dimohon untuk menuliskan kode ini \npada keterangan transfer',
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          ),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pembeli:',
                    style: TextStyle(fontSize: 18),
                  ),
                  // Ganti komentar dengan detail pembeli
                  Text(
                    'Nama Pembeli: John Doe\nEmail: john@example.com\nNomor Telepon: +1 123-456-7890',
                    style: TextStyle(fontSize: 16),
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
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Penjual:',
                    style: TextStyle(fontSize: 18),
                  ),
                  // Ganti komentar dengan detail penjual
                  Text(
                    'Nama Penjual: Seller Name\nEmail: seller@example.com\nNomor Telepon: +1 987-654-3210',
                    style: TextStyle(fontSize: 16),
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
                    'Total Pembayaran:',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    orderPrice,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
