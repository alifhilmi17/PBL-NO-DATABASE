import 'package:flutter/material.dart';
import 'package:pubblicita/pembayaran/pembayaran_kendaraan_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PemesananKendaraanPage extends StatefulWidget {
  final String jenisKendaraan;
  final String catalogContent;
  final String imagePath;

  const PemesananKendaraanPage({
    super.key,
    required this.jenisKendaraan,
    required this.catalogContent,
    required this.imagePath,
  });

  @override
  _PemesananKendaraanPageState createState() => _PemesananKendaraanPageState();
}

class _PemesananKendaraanPageState extends State<PemesananKendaraanPage> {
  int selectedPaymentOption = 0; // Default selected payment option

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final cardWidth =
              constraints.maxWidth > 400 ? 400.0 : constraints.maxWidth - 20;

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: SizedBox(
                    width: cardWidth,
                    height: 550,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            widget.imagePath,
                            width: cardWidth - 20,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.catalogContent,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Pembayaran:',
                                style: TextStyle(fontSize: 15),
                              ),
                              buildPaymentOptionRadio(1, 'Pembayaran Didepan'),
                              const Text(
                                'Pembayaran Melalui Bank:',
                                style: TextStyle(fontSize: 15),
                              ),
                              buildPaymentOptionRadio(2, 'Mandiri \n10900'),
                              buildPaymentOptionRadio(3, 'BTN \n140'),
                              buildPaymentOptionRadio(4, 'BNI \n21'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: selectedPaymentOption != 0
                        ? () async {
                            String orderId = await saveDataToFirestore(
                              widget.jenisKendaraan,
                              selectedPaymentOption,
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentPage(
                                  orderId: orderId,
                                  jenisKendaraan: widget.jenisKendaraan,
                                  selectedPaymentOption: selectedPaymentOption,
                                  orderPrice: 'Rp.200.000',
                                ),
                              ),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A424B),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      minimumSize: Size(
                        cardWidth,
                        0,
                      ),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          'Pesan Sekarang',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Spacer(),
                        Text(
                          'Rp.200.000',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
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

  Future<String> saveDataToFirestore(
    String jenisKendaraan,
    int selectedPaymentOption,
  ) async {
    try {
      CollectionReference orders = _firestore.collection('orders');
      DocumentReference result = await orders.add({
        'jenisKendaraan': jenisKendaraan,
        'selectedPaymentOption': selectedPaymentOption,
        'orderPrice': 'Rp.200.000',
        'status': 'PENDING',
        'timestamp': FieldValue.serverTimestamp(),
      });

      return result.id; // return the orderId
    } catch (e) {
      print('Error saving data to Firestore: $e');
      // Handle the error as needed
      return ''; // or throw an exception
    }
  }
}
