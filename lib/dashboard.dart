import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart'; // Impor package navbar
import 'package:carousel_slider/carousel_slider.dart'; // Impor Carousel
import 'kendaraan_page.dart'; // Impor file kendaraan_page.dart
import 'banner_page.dart'; // Impor file banner_page.dart
import 'billboard_page.dart'; // Impor file banner_page.dart
import 'profile_page.dart'; // Impor file profile_page.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the corresponding page based on the selected index
    switch (index) {
      case 0:
        // Home page (DashboardPage in this case)
        break;
      case 1:
        // Cart page
        // You can replace 'YourCartPage()' with the actual cart page widget
        // Navigator.push(context, MaterialPageRoute(builder: (context) => YourCartPage()));
        break;
      case 2:
        // Profile page
        // You can replace 'YourProfilePage()' with the actual profile page widget
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfilePage()));
        break;
    }
  }

  Widget buildWelcomeText() {
    return Row(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(
              top: 5.0,
              left: 8.0,
              right: 8.0,
            ),
            child: Text(
              'Hallo,', // Text Selamat Datang
              style: TextStyle(
                color: Color(0xFF0D0140),
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'DM Sans', // Tambahkan font family
              ),
            ),
          ),
        ),
        Spacer(), // Memberikan ruang kosong di antara teks dan ikon
        IconButton(
          icon: const Icon(Icons.chat),
          iconSize: 35,
          onPressed: () {
            // Tambahkan logika yang ingin Anda lakukan ketika ikon chat ditekan di sini
          },
        ),
      ],
    );
  }

  Widget buildUserNameText() {
    return const Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(
          top: 5.0,
          left: 8.0,
          right: 8.0,
          bottom: 20.0,
        ),
        child: Text(
          'Username',
          style: TextStyle(
            color: Color(0xFF0D0140),
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'DM Sans', // Tambahkan font family
          ),
        ),
      ),
    );
  }

  Widget buildPromotionCard() {
    return Center(
      child: SizedBox(
        width: 400,
        height: 200,
        child: Card(
          elevation: 3,
          color: Colors.white,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              CarouselSlider(
                items: [
                  Image.network(
                    'images/bugatti.jpg',
                    width: 400,
                    height: 200,
                    fit: BoxFit.fitWidth,
                  ),
                  Image.network(
                    'images/promosi bni.jpg',
                    width: 400,
                    height: 200,
                    fit: BoxFit.fitWidth,
                  ),
                  // Add other carousel images here
                ],
                options: CarouselOptions(
                  height: 300,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChooseText() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
          top: 16.0, // Tambahkan jarak di sini
          left: 8.0,
        ),
        child: Text(
          'Pilih yang Diinginkan',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontFamily: 'DM Sans', // Tambahkan font family
          ),
        ),
      ),
    );
  }

  Widget buildCardBillboard() {
    return Center(
        child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BillboardPage(),
          ),
        );
      },
      child: SizedBox(
        width: 400,
        height: 200,
        child: Card(
          elevation: 3,
          color: Colors.white,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Image.asset(
                'images/billboarddashboard.jpg',
                width: 400,
                height: 150,
                fit: BoxFit.cover,
              ),
              const Positioned(
                bottom: 8,
                left: 8,
                child: Text(
                  'Billboard',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DM Sans',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget buildCardbanner() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const BannerPage()), // Navigasi ke halaman BannerPage
        );
      },
      child: SizedBox(
        width: 200,
        height: 150,
        child: Card(
          elevation: 3,
          color: Colors.white, // Atur nilai alpha untuk membuat card transparan
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // Set sudut melengkung di sini
          ),
          child: Stack(
            children: [
              Image.asset(
                'images/bannerdashboard.png',
                width: 200,
                height: 100,
                fit: BoxFit.cover,
              ),
              const Positioned(
                bottom: 8,
                left: 8,
                child: Text(
                  'BANNER',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DM Sans',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardkendaraan() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const KendaraanPage()), // Navigasi ke halaman KendaraanPage
        );
      },
      child: SizedBox(
        width: 200,
        height: 150,
        child: Card(
          elevation: 3,
          color: Colors.white, // Atur nilai alpha untuk membuat card transparan
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // Set sudut melengkung di sini
          ),
          child: Stack(
            children: [
              Image.asset(
                'images/kendaraandashboard.jpg',
                width: 200,
                height: 100,
                fit: BoxFit.cover,
              ),
              const Positioned(
                bottom: 8,
                left: 8,
                child: Text(
                  'KENDARAAN',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DM Sans',
                  ),
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildWelcomeText(),
            buildUserNameText(),
            buildPromotionCard(),
            buildChooseText(),
            const SizedBox(height: 20),
            buildCardBillboard(), // Billboard
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildCardbanner(), // Card Banner
                buildCardkendaraan(), // Card Kendaraan
              ],
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
              tabs: const [
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
