import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart'; // Impor package navbar
import 'package:carousel_slider/carousel_slider.dart'; // Impor Carousel
import 'catalog/kendaraan_page.dart'; // Impor file kendaraan_page.dart
import 'catalog/banner_page.dart'; // Impor file banner_page.dart
import 'catalog/billboard_page.dart'; // Impor file banner_page.dart
import 'user/profile_page.dart'; // Impor file profile_page.dart
import 'cart/keranjang_page.dart'; // Impor file keranjang_page.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, Key});

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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const CartPage()));
        break;
      case 2:
        // Profile page
        // You can replace 'YourProfilePage()' with the actual profile page widget
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfilePage()));
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
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'DM Sans', // Tambahkan font family
              ),
            ),
          ),
        ),
        const Spacer(), // Memberikan ruang kosong di antara teks dan ikon
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
            color: Colors.black,
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
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
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
                  width: double.infinity,
                  height: double.infinity,
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
      ),
    );
  }

  Widget buildCardbanner() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BannerPage(),
          ),
        );
      },
      child: SizedBox(
        width: 190,
        height: 150,
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
                'images/bannerdashboard.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              const Positioned(
                bottom: 8,
                left: 8,
                child: Text(
                  'Banner',
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
            builder: (context) => const KendaraanPage(),
          ),
        );
      },
      child: SizedBox(
        width: 190,
        height: 150,
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
                'images/kendaraandashboard.jpg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              const Positioned(
                bottom: 8,
                left: 8,
                child: Text(
                  'Kendaraan',
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
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
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
                buildCardBillboard(),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildCardbanner(),
                    buildCardkendaraan(),
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
                  gap: 8,
                  activeColor: const Color(0xFF143E47),
                  iconSize: constraints.maxWidth *
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
      },
    );
  }
}
