import 'package:flutter/material.dart';
import 'package:pbl/signup.dart';
// import 'dashboard.dart';

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
      body: Container(
        padding: const EdgeInsets.fromLTRB(19, 50, 23, 50),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xffdce9f9),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(4, 0, 0, 30),
              width: 300,
              height: 300,
              child: Image.asset(
                'images/splash.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 155, 12),
              constraints: const BoxConstraints(
                maxWidth: 193,
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
                  children: [
                    TextSpan(text: 'Find Your \n'),
                    TextSpan(
                      text: 'Dream Advertise',
                      style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        height: 0.9469999313,
                        decoration: TextDecoration.underline,
                        color: Color(0xfffca34d),
                        decorationColor: Color(0xfffca34d),
                      ),
                    ),
                    TextSpan(text: ' \nHere!'),
                    TextSpan(
                        text:
                            '\nExplore all the most exciting publicity for your product roles based on your imagination.',
                        style: TextStyle(
                          fontSize:
                              17, // Add any additional styling you want for this new text.
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignUpPage(),
            ),
          ); // Tambahkan logika ketika tombol Sign Up ditekan di sini
        },
        backgroundColor: Colors.blue,
        child: const Icon(
            Icons.arrow_forward), // Ganti dengan warna yang diinginkan
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
