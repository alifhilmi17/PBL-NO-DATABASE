import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pbl/dashboard.dart';
import 'profile_settings.dart';
import 'package:pbl/cart/keranjang_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      if (_selectedIndex == index) {
        // Add animation logic here
      }

      _selectedIndex = index;

      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage()),
        );
      } else if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartPage()),
        );
      } else if (index == 2) {
        // Add logic for "Profile" page
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30), // Increased SizedBox height
            Card(
              elevation: 10,
              margin: const EdgeInsets.all(0),
              color: const Color(0xFF143E47),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: 150.0, // Adjusted height
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/bgprofile.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: constraints.maxWidth < 200
                                  ? 30
                                  : 40, // Adjusted radius
                              backgroundImage: AssetImage('images/jfgg.jpg'),
                            ),
                            SizedBox(height: 8), // Reduced spacing
                            Text(
                              'Nama Saya',
                              style: TextStyle(
                                fontSize: constraints.maxWidth < 200
                                    ? 14
                                    : 18, // Adjusted font size
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4), // Reduced spacing
                            Text(
                              'Pekerjaan Saya',
                              style: TextStyle(
                                fontSize: constraints.maxWidth < 200
                                    ? 10
                                    : 14, // Adjusted font size
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0), // Reduced padding
                    child: IconButton(
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileSettingsPage(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30), // Increased SizedBox height
            buildInfoCard('Nama Lengkap', _fullNameController, 'Nama Anda'),
            buildInfoCard(
                'Nama Usaha', _businessNameController, 'Nama Usaha Anda'),
            buildInfoCard('Email', _emailController, 'Email Anda'),
            buildInfoCard(
                'Nomor Telepon', _phoneNumberController, 'Nomor Telepon Anda'),
            buildInfoCard(
                'Lokasi Usaha', _locationController, 'Lokasi Usaha Anda'),
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
              iconSize: 30,
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

Widget buildInfoCard(
    String title, TextEditingController controller, String content) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 25, bottom: 4), // Reduced bottom padding
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14, // Adjusted font size
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(
              vertical: 15), // Reduced vertical margin
          child: ListTile(
            title: TextField(
              controller: controller,
              onChanged: (text) {
                // Do something with the changed text, if needed
                // Example: Save to a variable or perform validation
              },
              style: const TextStyle(
                fontSize: 12, // Adjusted font size
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none, // Remove the underline
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
