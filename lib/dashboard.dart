import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'catalog/kendaraan_page.dart';
import 'catalog/banner_page.dart';
import 'catalog/billboard_page.dart';
import 'user/profile_page.dart';
import 'cart/keranjang_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        // Home page (DashboardPage in this case)
        break;
      case 1:
        // Cart page
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const CartPage()));
        break;
      case 2:
        // Profile page
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfilePage()));
        break;
    }
  }

  double iconSizeFromConstraints(BoxConstraints constraints) {
    return constraints.maxWidth * 0.07;
  }

  double fontSizeFromConstraints(BoxConstraints constraints, double baseSize) {
    return constraints.maxWidth * baseSize;
  }

  Widget buildWelcomeText(BoxConstraints constraints) {
    return Row(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 5.0,
              left: 8.0,
              right: 8.0,
            ),
            child: Text(
              'Hallo,',
              style: TextStyle(
                color: Colors.black,
                fontSize: fontSizeFromConstraints(constraints, 0.10),
                fontWeight: FontWeight.bold,
                fontFamily: 'DM Sans',
              ),
            ),
          ),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.chat),
          iconSize: iconSizeFromConstraints(constraints),
          onPressed: () {
            // Add logic for chat icon pressed
          },
        ),
      ],
    );
  }

  Widget buildUserNameText() {
    return const Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 5.0,
            left: 8.0,
            right: 8.0,
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
        ));
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
                  Image.asset(
                    'images/bugatti.jpg',
                    width: 400,
                    height: 200,
                    fit: BoxFit.fitWidth,
                  ),
                  Image.asset(
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
                width: 190,
                height: 100,
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
                width: 190,
                height: 100,
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
                const SizedBox(height: 30),
                buildWelcomeText(constraints),
                buildUserNameText(),
                buildPromotionCard(),
                buildChooseText(),
                const SizedBox(height: 10),
                buildCardBillboard(),
                const SizedBox(height: 20),
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
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth * 0.04,
                  vertical: constraints.maxWidth * 0.024,
                ),
                child: GNav(
                  gap: 8,
                  activeColor: const Color(0xFF143E47),
                  iconSize: iconSizeFromConstraints(constraints),
                  padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.04,
                    vertical: constraints.maxWidth * 0.024,
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
