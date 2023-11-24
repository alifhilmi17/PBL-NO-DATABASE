import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pbl/cart/keranjang_page.dart';
import 'package:pbl/user/profile_page.dart';
import 'package:pbl/dashboard.dart';
import 'package:pbl/pemesanan/pemesanan_billboard_page.dart';

class BillboardPage extends StatefulWidget {
  const BillboardPage({Key? key}) : super(key: key);

  @override
  _BillboardPageState createState() => _BillboardPageState();
}

class _BillboardPageState extends State<BillboardPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        ); // Tambahkan logika untuk "Home" di sini
      } else if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CartPage()),
        );
        // Tambahkan logika untuk "Cart" di sini
      } else if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
        // Tambahkan logika untuk "Profile" di sini
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
            MaterialPageRoute(
              builder: (context) => const DashboardPage(),
            );
            // Fungsi Tombol Kembali
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
                'images/billboardavatar.png',
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
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Billboard',
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

          // Card 1
          Positioned(
            top: 220,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                width: 380,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    const Positioned(
                      top: 10,
                      left: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ukuran 60cm x 190cm',
                            style: TextStyle(
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
                          // Tindakan yang ingin Anda lakukan saat tombol ditekan
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PemesananBillboardPage(
                                jenisBillboard: 'Billboard L',
                                catalogContent:
                                    'Media promosi yang dicetak menggunakan \nprint digital berbentuk portrait atau vertikal.\nDi design menggunakan \nAdobe Photoshop dan CorelDraw.',
                                imagePath:
                                    'images/gambarcatalogbillboard.png', // Add the image path here
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.grey, // Warna latar belakang tombol
                        ),
                        child: const Text(
                          'Pesan',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight:
                                FontWeight.bold, // Warna teks dan tombol
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
                            'images/gambarcatalogbillboard.png',
                            width: 300,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Media promosi yang dicetak menggunakan \nprint digital berbentuk portrait atau vertikal.\nDi design menggunakan \nAdobe Photoshop dan CorelDraw.',
                            style: TextStyle(
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
            ),
          ),

          // Card 2
          Positioned(
            top: 500,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                width: 380,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    const Positioned(
                      top: 10,
                      left: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ukuran 80cm x 190cm',
                            style: TextStyle(
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
                          // Tindakan yang ingin Anda lakukan saat tombol ditekan
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PemesananBillboardPage(
                                jenisBillboard: 'Billboard XL',
                                catalogContent:
                                    'Media promosi yang dicetak menggunakan \nprint digital berbentuk portrait atau vertikal.\nDi design menggunakan \nAdobe Photoshop dan CorelDraw.',
                                imagePath:
                                    'images/gambarcatalogbillboard.png', // Add the image path here
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.grey, // Warna latar belakang tombol
                        ),
                        child: const Text(
                          'Pesan',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight:
                                FontWeight.bold, // Warna teks dan tombol
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
                            'images/gambarcatalogbillboard.png',
                            width: 300,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Media promosi yang dicetak menggunakan \nprint digital berbentuk portrait atau vertikal.\nDi design menggunakan \nAdobe Photoshop dan CorelDraw.',
                            style: TextStyle(
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
            ),
          ),
        ],
      ),
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
              iconSize: 35,
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
}
