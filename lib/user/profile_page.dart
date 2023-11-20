import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pbl/dashboard.dart';
import 'profile_settings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const ProfilePage({super.key});

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
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        );
      } else if (index == 1) {
        // Add logic for "Cart" page
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
            Card(
              elevation: 10,
              margin: const EdgeInsets.all(0),
              color: const Color(0xFF0D0140),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: 200.0,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/bgprofile.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('images/jfgg.jpg'),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Nama Saya',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Pekerjaan Saya',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
            const SizedBox(height: 16),
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
                  onPressed: () => _onItemTapped(0),
                ),
                GButton(
                  icon: Icons.shopping_cart,
                  text: 'Cart',
                  onPressed: () => _onItemTapped(1),
                ),
                GButton(
                  icon: Icons.account_circle,
                  text: 'Profile',
                  onPressed: () => _onItemTapped(2),
                ),
              ],
              selectedIndex: _selectedIndex,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoCard(
      String title, TextEditingController controller, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 8),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: TextField(
                controller: controller,
                onChanged: (text) {
                  // Do something with the changed text, if needed
                  // Example: Save to a variable or perform validation
                },
                style: const TextStyle(
                  fontSize: 16,
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
}
