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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
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
                          height: 120, // Adjust the height of the image
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 30.0),
                        // Increase the top padding to move the text down
                        child: Text(
                          widget.catalogContent,
                          style: TextStyle(fontSize: 16),
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
              Center(
                child: ElevatedButton(
                  onPressed: selectedPaymentOption != 0
                      ? () {
                          // Do something with booking data and selected payment option
                          print(
                              'Billboard: ${widget.jenisBillboard}, Pesan Sekarang, Jenis Pembayaran: $selectedPaymentOption');
                        }
                      : null, // Disable the button if no payment option is selected
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    minimumSize: Size(
                      MediaQuery.of(context).size.width,
                      0,
                    ),
                  ),
                  child: Row(
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
            ])));
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
