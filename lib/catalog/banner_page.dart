import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pbl/user/profile_page.dart';
import 'package:pbl/dashboard.dart';
import 'package:pbl/pemesanan/pemesanan_banner_page.dart';
import 'package:pbl/cart/keranjang_page.dart';

class BannerPage extends StatefulWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  _BannerPageState createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        );
      } else if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CartPage()),
        );
      } else if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
      }
    });
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
      body: Stack(alignment: Alignment.center, children: [
        // Gambar di tengah atas
        Positioned(
          top: 0,
          child: ClipOval(
            child: Image.asset(
              'images/bannerdashboard.png',
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
                  'Banner',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                '3 - 5 Hari Pengerjaan ',
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
                  padding: const EdgeInsets.only(top: 220), // Adjust as needed
                  child: buildCard(
                    jenisBanner: 'Banner L',
                    catalogContent:
                        'Media promosi yang dicetak menggunakan \nprint digital berbentuk portrait atau vertikal.\nDi design menggunakan \nAdobe Photoshop dan CorelDraw.',
                    imagePath: 'images/gambarcatalogbillboard.png',
                  ),
                ),
              ),

              // Card 2
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(), // Adjust as needed
                  child: buildCard(
                    jenisBanner: 'Banner XL',
                    catalogContent:
                        'Media promosi yang dicetak menggunakan \nprint digital berbentuk portrait atau vertikal.\nDi design menggunakan \nAdobe Photoshop dan CorelDraw.',
                    imagePath: 'images/gambarcatalogbillboard.png',
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            child: GNav(
              gap: 8,
              activeColor: const Color(0xFF143E47),
              iconSize: MediaQuery.of(context).size.width *
                  0.07, // Adjust icon size responsively
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              color: const Color(0xFF143E47),
              tabs: const [
                GButton(
                  icon: Icons.home,
                ),
                GButton(
                  icon: Icons.shopping_cart,
                ),
                GButton(
                  icon: Icons.account_circle,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard({
    required String jenisBanner,
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
                    jenisBanner,
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
                      builder: (context) => PemesananBannerPage(
                        jenisBanner: jenisBanner,
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
            // Adjusted position for the card content
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
