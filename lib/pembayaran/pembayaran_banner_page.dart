import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pubblicita/cart/keranjang_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PaymentPage extends StatelessWidget {
  final String jenisBanner;
  final int selectedPaymentOption;
  final String orderPrice;
  final String orderCode;

  PaymentPage({
    super.key,
    required this.jenisBanner,
    required this.selectedPaymentOption,
    required this.orderPrice,
  }) : orderCode = generateOrderCode(jenisBanner);

  static String generateOrderCode(String jenisBanner) {
    return 'BNR_${jenisBanner}_${DateFormat('yyyyMMdd_HHmmss').format(DateTime.now())}';
  }

  Future<Map<String, dynamic>> _fetchUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        DocumentSnapshot<Map<String, dynamic>> snapshot =
            await FirebaseFirestore.instance
                .collection('users')
                .doc(user.uid)
                .get();

        return snapshot.data() ?? {};
      } else {
        // Handle the case where the user is not logged in
        return {};
      }
    } catch (e) {
      print('Error fetching user data: $e');
      // Handle the error as needed
      return {};
    }
  }

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        PlatformFile file = result.files.first;
        print('File path: ${file.path}');
        print('File name: ${file.name}');
        // Handle the selected file
      } else {
        // User canceled the file picking
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  Future<void> _savePaymentDataAndShowSuccessMessage(
      BuildContext context) async {
    try {
      await savePaymentDataToFirestore();
      _showSuccessMessage(context);
    } catch (e) {
      print('Error saving payment data: $e');
      // Handle the error as needed
      // Show an error message to the user
    }
  }

  Future<void> savePaymentDataToFirestore() async {
    CollectionReference payments =
        FirebaseFirestore.instance.collection('payments');

    await payments.add({
      'orderCode': orderCode,
      'jenisBanner': jenisBanner,
      'selectedPaymentOption': selectedPaymentOption,
      'orderPrice': orderPrice,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  void _showSuccessMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pemesanan Berhasil'),
          content: const Text(
              'Terima kasih! Atas Pemesanannya Harap Meelakukan Pembayaran.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const CartPage()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildUserDataCard(Map<String, dynamic> userData) {
    return SizedBox(
      width: 500,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: const Color(0xB21B424C),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama Pembeli: ${userData['displayName'] ?? 'John Doe'}\n'
                'Email: ${userData['email'] ?? 'john@example.com'}\n'
                'Nomor Telepon: ${userData['phoneNumber'] ?? '+1 123-456-7890'}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchUserData(),
      builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error loading user data: ${snapshot.error}');
        } else {
          Map<String, dynamic> userData = snapshot.data ?? {};

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
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            orderCode,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Text(
                    'Dimohon untuk menuliskan kode ini \npada keterangan transfer',
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                  _buildUserDataCard(userData),
                  SizedBox(
                    width: 500,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: const Color(0xB21B424C),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
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
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
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
                            const Row(
                              children: [
                                Icon(
                                  Icons.access_time_outlined,
                                  size: 25,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Batas waktu pembayaran 24 jam',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              'Dimohon setelah melakukan pembayaran,\ndapat menambahkan screenshoot layar untuk verifikasi',
                              style: TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 15),
                            ElevatedButton.icon(
                              onPressed: _pickFile,
                              icon: const Icon(
                                Icons.upload_file,
                                color: Color(0xFF1A424B),
                              ),
                              label: const Text(
                                'Upload File',
                                style: TextStyle(
                                  color: Color(0xFF1A424B),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          _savePaymentDataAndShowSuccessMessage(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1A424B),
                          minimumSize: Size(
                            MediaQuery.of(context).size.width,
                            0,
                          ),
                        ),
                        child: const Text(
                          'Selesai',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
