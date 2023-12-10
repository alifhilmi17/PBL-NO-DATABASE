import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pubblicita/user/profile_page.dart';
import 'package:pubblicita/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CartPage(),
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Stream<QuerySnapshot<Map<String, dynamic>>> _paymentStream;
  int _selectedIndex = 1; // Default selected index for CartPage
  User? _currentUser;

  @override
  void initState() {
    super.initState();
    _currentUser = FirebaseAuth.instance.currentUser;
    _paymentStream =
        FirebaseFirestore.instance.collection('payments').snapshots();
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

  // State to track whether each icon is pressed or not
  bool isShoppingBagPressed = false;
  bool isLocalShippingPressed = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the corresponding page based on the selected index
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        );
        break;
      case 1:
        // Cart page
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            final fullName = snapshot.data!['full_name'];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 25),
                  Card(
                    elevation: 10,
                    margin: const EdgeInsets.all(0),
                    color: const Color(0xFF143E47),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      height: 200.0,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/bgprofile.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('images/jfgg.jpg'),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            fullName,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildIconWithText(Icons.shopping_bag_outlined, 'Orderan',
                          isShoppingBagPressed),
                      buildIconWithText(Icons.local_shipping_outlined,
                          'Progress', isLocalShippingPressed),
                    ],
                  ),

                  // Display payment information only if shopping bag is pressed
                  if (isShoppingBagPressed)
                    StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: _paymentStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text(
                              'Error loading payments: ${snapshot.error}');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }

                        List<QueryDocumentSnapshot<Map<String, dynamic>>>
                            payments = snapshot.data!.docs;

                        return Expanded(
                          child: ListView.builder(
                            itemCount: payments.length,
                            itemBuilder: (context, index) {
                              var paymentData = payments[index].data();

                              return Card(
                                child: ListTile(
                                  title: Text(
                                      'Order Code: ${paymentData['orderCode']}'),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Billboard: ${paymentData['jenisBillboard']}'),
                                      Text(
                                          'Banner: ${paymentData['jenisBanner']}'),
                                      Text(
                                          'Kendaraan: ${paymentData['jenisKendaraan']}'),
                                      // Add more fields as needed
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                ],
              ),
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

  Widget buildIconWithText(IconData icon, String text, bool isPressed) {
    return GestureDetector(
      onTap: () {
        // Toggle the state when the icon is pressed
        setState(() {
          if (icon == Icons.shopping_bag_outlined) {
            isShoppingBagPressed = !isShoppingBagPressed;
          } else if (icon == Icons.local_shipping_outlined) {
            isLocalShippingPressed = !isLocalShippingPressed;
          }
        });
      },
      child: Column(
        children: [
          Icon(
            icon,
            size: 35,
            color: isPressed ? Colors.blue : Colors.black,
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              color: isPressed ? Colors.blue : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
