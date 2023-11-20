import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';

class PaymentPage extends StatelessWidget {
  final String jenisKendaraan;
  final int selectedPaymentOption;
  final String orderPrice;
  final String orderCode;

  PaymentPage({
    super.key,
    required this.jenisKendaraan,
    required this.selectedPaymentOption,
    required this.orderPrice,
  }) : orderCode = generateOrderCode(
          jenisKendaraan,
        );

  static String generateOrderCode(String jenisKendaraan) {
    return 'Kendaraan_${jenisKendaraan}_${DateFormat('yyyyMMdd_HHmmss').format(DateTime.now())}';
  }

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        // Handle the selected file
        PlatformFile file = result.files.first;
        print('File path: ${file.path}');
        print('File name: ${file.name}');
        // Add your logic for handling the uploaded file here
      } else {
        // User canceled the file picking
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xFF0D0140),
          size: 30,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kode Pemesanan:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      orderCode,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              'Dimohon untuk menuliskan kode ini \npada keterangan transfer',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            Container(
              width: 500,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Color(0xFF1B424C), // Warna latar belakang card
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pembeli:',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Nama Pembeli: John Doe\n'
                        'Email: john@example.com\n'
                        'Nomor Telepon: +1 123-456-7890',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 500,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Color(0xFF1B424C), // Warna latar belakang card
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Penjual:',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Nama Penjual: Seller Name\n'
                        'Email: Seller@example.com\n'
                        'Nomor Telepon: +1 123-456-7890',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Pembayaran:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    orderPrice,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            size: 25,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Batas waktu pembayaran 24 jam',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Dimohon setelah melakukan pembayaran,\ndapat menambahkan screenshoot layar untuk verifikasi',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton.icon(
                        onPressed: _pickFile,
                        icon: Icon(Icons.upload_file),
                        label: Text('Upload File'),
                      ),
                    ], // Implement your file upload logic here
                    // You can use packages like file_picker to facilitate file selection
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15, vertical: 15), // Ubah nilai sesuai kebutuhan
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    // Tambahkan logika untuk tombol di sini
                    // Contoh: Navigator.pushReplacementNamed(context, '/halaman_berikutnya');
                  },
                  style: ElevatedButton.styleFrom(
                    primary:
                        Color(0xFF1B424C), // Tambahkan warna sesuai kebutuhan
                    minimumSize: Size(
                      MediaQuery.of(context).size.width,
                      0,
                    ),
                  ),
                  child: Text('Selesai'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
