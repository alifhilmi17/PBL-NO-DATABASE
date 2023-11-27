import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pbl/dashboard.dart';
import 'package:pbl/user/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CartPage(),
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _selectedIndex = 0;

  // State untuk melacak apakah setiap ikon ditekan atau tidak
  bool isShoppingBagPressed = false;
  bool isCreditCardPressed = false;
  bool isLocalShippingPressed = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the corresponding page based on the selected index
    switch (index) {
      case 0:
        // Dashboard page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        );
        break;
      case 1:
        // Cart page
        // Jika Anda ingin tetap di halaman ini, Anda bisa menghilangkan aksi ini
        break;
      case 2:
        // Profile page
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildIconWithText(Icons.shopping_bag_outlined, 'Orderan',
                    isShoppingBagPressed),
                buildIconWithText(
                    Icons.credit_card, 'Belum Bayar', isCreditCardPressed),
                buildIconWithText(Icons.local_shipping_outlined, 'Progress',
                    isLocalShippingPressed),
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
          } else if (icon == Icons.credit_card) {
            isCreditCardPressed = !isCreditCardPressed;
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
            color: isPressed
                ? Colors.blue
                : Colors.black, // Change color when pressed
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              color: isPressed
                  ? Colors.blue
                  : Colors.black, // Change text color when pressed
            ),
          ),
        ],
      ),
    );
  }
}
