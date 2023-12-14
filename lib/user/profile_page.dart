import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profile_settings.dart';
import 'package:pubblicita/dashboard.dart';
import 'package:pubblicita/cart/keranjang_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;
  User? _currentUser;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _currentUser = FirebaseAuth.instance.currentUser;
  }

  Future<DocumentSnapshot> getUserData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: _currentUser?.email)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first;
    } else {
      return FirebaseFirestore.instance.collection('users').doc().get();
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
      }
    });
  }

  void _saveChanges() async {
    try {
      // Get the current user's document reference
      DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(_currentUser?.uid);

      // Update the user data in Firestore
      await userRef.update({
        'full_name': _fullNameController.text,
        'business_name': _businessNameController.text,
        'email': _emailController.text,
        'phone_number': _phoneNumberController.text,
      });

      // Show a success message or navigate to another screen if needed
      print('Changes saved successfully!');
    } catch (e) {
      // Handle errors
      print('Error saving changes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder<DocumentSnapshot>(
          future: getUserData(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.data == null || !snapshot.data!.exists) {
              return Text('User data not found');
            } else {
              // Extract user data from the snapshot
              final fullName = snapshot.data!['full_name'];
              final businessName = snapshot.data!['business_name'];
              final email = snapshot.data!['email'];
              final phoneNumber = snapshot.data!['phone_number'];

              // Update TextEditingController values
              _fullNameController.text = fullName;
              _businessNameController.text = businessName;
              _emailController.text = email;
              _phoneNumberController.text = phoneNumber;

              return ListView(
                children: [
                  _buildUserProfileCard(fullName),
                  buildInfoCard(
                      'Nama Lengkap', _fullNameController, 'Nama Anda'),
                  buildInfoCard(
                      'Nama Usaha', _businessNameController, 'Nama Usaha Anda'),
                  buildInfoCard('Email', _emailController, 'Email Anda'),
                  buildInfoCard('Nomor Telepon', _phoneNumberController,
                      'Nomor Telepon Anda'),
                ],
              );
            }
          },
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
        floatingActionButton: FloatingActionButton(
          onPressed: _saveChanges,
          child: Text('Save'),
          backgroundColor: const Color(0xFF143E47),
        ),
      ),
    );
  }

  Widget _buildUserProfileCard(String fullName) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 40),
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
                  height: 150.0,
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
                            radius: constraints.maxWidth < 200 ? 30 : 40,
                            backgroundImage:
                                const AssetImage('images/jfgg.jpg'),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            fullName,
                            style: TextStyle(
                              fontSize: constraints.maxWidth < 200 ? 14 : 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
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
          const SizedBox(height: 20),
        ],
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
            padding: const EdgeInsets.only(left: 16, bottom: 4),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 12,
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
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: TextField(
                controller: controller,
                onChanged: (text) {
                  // Do something with the changed text, if needed
                  // Example: Save to a variable or perform validation
                },
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
