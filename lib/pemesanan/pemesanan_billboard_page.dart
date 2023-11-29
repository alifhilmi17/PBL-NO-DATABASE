import 'package:flutter/material.dart';
import 'package:pubblicita/pembayaran/pembayaran_billboard_page.dart';

class PemesananBillboardPage extends StatefulWidget {
  final String jenisBillboard;
  final String catalogContent;
  final String imagePath;

  const PemesananBillboardPage({
    Key? key,
    required this.jenisBillboard,
    required this.catalogContent,
    required this.imagePath,
  }) : super(key: key);

  @override
  _PemesananBillboardPageState createState() => _PemesananBillboardPageState();
}

class _PemesananBillboardPageState extends State<PemesananBillboardPage> {
  int selectedPaymentOption = 0; // Default selected payment option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xFF0D0140),
          size: 20,
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
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            widget.imagePath,
                            width: cardWidth - 20,
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
                        buildPaymentOptionRadio(1, 'Pembayaran Didepan'),
                        const SizedBox(height: 8), // Add spacing here
                        const Text(
                          'Transfer Bank:',
                          style: TextStyle(fontSize: 18),
                        ),
                        buildPaymentOptionRadio(2, 'Mandiri \n10900'),
                        const SizedBox(height: 8), // Add spacing here
                        buildPaymentOptionRadio(3, 'BTN \n140'),
                        const SizedBox(height: 8), // Add spacing here
                        buildPaymentOptionRadio(4, 'BNI \n21'),
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
                      backgroundColor: const Color(0xFF1A424B),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15), // Adjust the padding as needed
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
}
