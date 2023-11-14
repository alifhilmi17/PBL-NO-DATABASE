import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pbl/profile_page.dart';
import 'dashboard.dart';
import 'pemesanan_kendaraan_page.dart';

class KendaraanPage extends StatefulWidget {
  const KendaraanPage({Key? key}) : super(key: key);

  @override
  _KendaraanPageState createState() => _KendaraanPageState();
}

class _KendaraanPageState extends State<KendaraanPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage()),
        ); // Add logic for "Home" here
      } else if (index == 1) {
        // Add logic for "Cart" here
      } else if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        // Add logic for "Profile" here
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
        iconTheme: IconThemeData(
          color: Color(0xFF0D0140),
          size: 30,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Centered image at the top
            Container(
              width: 130,
              height: 130,
              child: ClipOval(
                child: Image.asset(
                  'images/kendaraandashboard.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Text below the image
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Text(
                    'Kendaraan',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '5 - 8 Hari Pengerjaan ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            // Card 1
            SizedBox(
              height: 16, // Adjust the spacing as needed
            ),
            Center(
              child: Container(
                width: 380,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey,
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
                            'Mobil',
                            style: TextStyle(
                              color: Color(0xFF150A33),
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
                          // Pass catalog content to the ordering page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PemesananKendaraanPage(
                                jenisKendaraan: 'Mobil',
                                catalogContent:
                                    'Media promosi yang dicetak menggunakan \nprint digital berbentuk portrait atau vertikal.\nDi design menggunakan \nAdobe Photoshop dan CorelDraw.',
                                imagePath:
                                    'images/bugatti.jpg', // Add the image path here
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        child: Text(
                          'Pesan',
                          style: TextStyle(
                            color: Colors.black,
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
                            'images/bugatti.jpg',
                            width: 300,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                          Text(
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

// Card 2
            SizedBox(
              height: 16, // Adjust the spacing as needed
            ),
            Center(
              child: Container(
                width: 380,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey,
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
                            'Motor',
                            style: TextStyle(
                              color: Color(0xFF150A33),
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
                          // Pass catalog content to the ordering page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PemesananKendaraanPage(
                                jenisKendaraan: 'Motor',
                                catalogContent:
                                    'Media promosi yang dicetak menggunakan \nprint digital berbentuk portrait atau vertikal.\nDi design menggunakan \nAdobe Photoshop dan CorelDraw.',
                                imagePath:
                                    'images/Motor.png', // Add the image path here
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        child: Text(
                          'Pesan',
                          style: TextStyle(
                            color: Colors.black,
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
                            'images/motor.png',
                            width: 300,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                          Text(
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

            // Card 3
            SizedBox(
              height: 16, // Adjust the spacing as needed
            ),
            Center(
              child: Container(
                width: 380,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey,
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
                            'Truk',
                            style: TextStyle(
                              color: Color(0xFF150A33),
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
                          // Pass catalog content to the ordering page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PemesananKendaraanPage(
                                jenisKendaraan: 'Truk',
                                catalogContent:
                                    'Media promosi yang dicetak menggunakan \nprint digital berbentuk portrait atau vertikal.\nDi design menggunakan \nAdobe Photoshop dan CorelDraw.',
                                imagePath:
                                    'images/truk.png', // Add the image path here
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        child: Text(
                          'Pesan',
                          style: TextStyle(
                            color: Colors.black,
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
                            'images/truk.png',
                            width: 300,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                          Text(
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
          ],
        ),
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
              rippleColor: Colors.black,
              hoverColor: Colors.black,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 35,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: const Color(0xFF0D0140),
              color: const Color(0xFF0D0140),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.shopping_cart,
                  text: 'Cart',
                ),
                GButton(
                  icon: Icons.account_circle,
                  text: 'Profile',
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
