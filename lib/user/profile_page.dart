import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pubblicita/dashboard.dart';
import 'profile_settings.dart';
import 'package:pubblicita/cart/keranjang_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User _currentUser;
  String _userName = ''; // Initialize to an empty string

  int _selectedIndex = 0;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Check if a user is authenticated
    _currentUser = FirebaseAuth.instance.currentUser!;

    // Call the method to update user name during initialization
    _updateUserName();
  }

  Future<void> _updateUserName() async {
    // Retrieve user data from Firestore
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(_currentUser.uid)
        .get();

    if (snapshot.exists) {
      // Use the display name from Firebase user or replace it with the actual field name
      String displayName = _currentUser.displayName ?? 'Nama Pengguna Default';

      setState(() {
        _userName = displayName;
      });

      // Update other UI elements, like the _fullNameController, with the user's name.
      _fullNameController.text = _userName;
    }
  }

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CartPage()),
        );
      } else if (index == 2) {
        // Add logic for "Profile" page
        _updateUserName(); // Call a method to update the user's name
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 40), // Increased SizedBox height
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
                                backgroundImage:
                                    const AssetImage('images/jfgg.jpg'),
                              ),
                              const SizedBox(height: 8), // Reduced spacing
                              Text(
                                _userName.isNotEmpty ? _userName : _userName,
                                style: TextStyle(
                                  fontSize:
                                      constraints.maxWidth < 200 ? 14 : 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4), // Reduced spacing
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
              const SizedBox(height: 20), // Increased SizedBox height
              buildInfoCard('Nama Lengkap', _fullNameController, 'Nama Anda'),
              buildInfoCard(
                  'Nama Usaha', _businessNameController, 'Nama Usaha Anda'),
              buildInfoCard('Email', _emailController, 'Email Anda'),
              buildInfoCard('Nomor Telepon', _phoneNumberController,
                  'Nomor Telepon Anda'),
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
              left: 16, bottom: 4), // Adjusted left padding
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12, // Adjusted font size
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(
              vertical: 8), // Adjusted vertical margin
          child: ListTile(
            title: TextField(
              controller: controller,
              onChanged: (text) {
                // Do something with the changed text, if needed
                // Example: Save to a variable or perform validation
              },
              style: const TextStyle(
                fontSize: 10, // Adjusted font size
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
