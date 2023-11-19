import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ChangePasswordPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Current Password',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF150B3D),
              fontFamily: 'DM Sans', // Set the font here
            ),
          ),
          Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: const TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'DM Sans', // Set the font here
                ),
                decoration: const InputDecoration(
                  labelStyle: TextStyle(
                    color: Color(0xFF150B3D),
                    fontFamily: 'DM Sans', // Set the font here
                  ),
                  border: InputBorder.none, // Remove the underline
                ),
                obscureText: true,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'New Password',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF150B3D),
              fontFamily: 'DM Sans', // Set the font here
            ),
          ),
          Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: const TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'DM Sans', // Set the font here
                ),
                decoration: const InputDecoration(
                  labelStyle: TextStyle(
                    color: Color(0xFF150B3D),
                    fontFamily: 'DM Sans', // Set the font here
                  ),
                  border: InputBorder.none, // Remove the underline
                ),
                obscureText: true,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Confirm Password',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF150B3D),
              fontFamily: 'DM Sans', // Set the font here
            ),
          ),
          Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: const TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'DM Sans', // Set the font here
                ),
                decoration: const InputDecoration(
                  labelStyle: TextStyle(
                    color: Color(0xFF150B3D),
                    fontFamily: 'DM Sans', // Set the font here
                  ),
                  border: InputBorder.none, // Remove the underline
                ),
                obscureText: true,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Add logic to change password
                // You may want to implement authentication checks and connect to a backend service
                // For simplicity, we are just printing the new password here
                print('Password changed successfully');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 160, vertical: 15), backgroundColor: const Color(0xFF1B424C),
                textStyle: const TextStyle(fontSize: 20), // Set the button color here
              ),
              child: const Text('UPDATE',
                  style: TextStyle(fontFamily: 'DM Sans')), // Set the font here
            ),
          ),
        ]),
      ),
    );
  }
}
