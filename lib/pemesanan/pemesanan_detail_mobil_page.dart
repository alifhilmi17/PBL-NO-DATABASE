import 'package:flutter/material.dart';
import 'package:pbl/pemesanan/pemesanan_kendaraan_page.dart';

class DetailMobilPage extends StatefulWidget {
  const DetailMobilPage({Key? key}) : super(key: key);

  @override
  _DetailMobilPageState createState() => _DetailMobilPageState();
}

class _DetailMobilPageState extends State<DetailMobilPage> {
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
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Gambar di tengah atas
          Positioned(
            top: 0,
            child: ClipOval(
              child: Image.asset(
                'images/kendaraandashboard.jpg',
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Teks di bawah gambar
          Positioned(
            top: 130,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(0),
                  child: const Text(
                    'Kendaraan',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  '5 - 8 Hari Pengerjaan ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Card 1
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 220),
                    child: buildCard(
                      jenisKendaraan: 'Half Design',
                      catalogContent:
                          'Media promosi yang dicetak menggunakan \nprint digital berbentuk portrait atau vertikal.\nDi design menggunakan \nAdobe Photoshop dan CorelDraw.',
                      imagePath: 'images/half design.jpg',
                    ),
                  ),
                ),

                // Card 2
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: buildCard(
                      jenisKendaraan: 'Full Design',
                      catalogContent:
                          'Media promosi yang dicetak menggunakan \nprint digital berbentuk portrait atau vertikal.\nDi design menggunakan \nAdobe Photoshop dan CorelDraw.',
                      imagePath: 'images/fulldesign.jpg',
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard({
    required String jenisKendaraan,
    required String catalogContent,
    required String imagePath,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 280,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    jenisKendaraan,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PemesananKendaraanPage(
                        jenisKendaraan: jenisKendaraan,
                        catalogContent: catalogContent,
                        imagePath: imagePath,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: const Text(
                  'Pesan',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    imagePath,
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    catalogContent,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
