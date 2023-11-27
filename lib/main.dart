import 'package:flutter/material.dart';
import 'package:pbl/user/signup.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: const EdgeInsets.fromLTRB(19, 50, 23, 50),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFC0DCDD),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(4, 0, 0, 10),
                  width: constraints.maxWidth * 0.8,
                  height: constraints.maxWidth * 0.8, // Adjust as needed
                  child: Image.asset(
                    'images/splash.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const Text(
                  'Find Your',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000),
                  ),
                ),
                const Text(
                  'Dream Advertise',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFCA34D),
                    decoration:
                        TextDecoration.underline, // Add this line for underline
                  ),
                ),
                const Text(
                  'Here!',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'Explore all the most exciting publicity for your product roles based on your imagination.',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 155, 12),
                  constraints: BoxConstraints(
                    maxWidth: constraints.maxWidth * 0.5, // Adjust as needed
                  ),
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        height: 0.9469999313,
                        color: Color(0xff000000),
                      ),
                      children: [],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignUpPage(),
            ),
          );
        },
        backgroundColor: const Color(0xFF1B424C),
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
