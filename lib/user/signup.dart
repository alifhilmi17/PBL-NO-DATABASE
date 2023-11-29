import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, Key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isPasswordVisible = false;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC0DCDD),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Buat Akun Anda",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DM Sans',
                  fontSize: 30,
                  color: Color(0xff0D0140),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Full Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DM Sans',
                      fontSize: 12,
                      color: Color(0xff0D0140),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: fullNameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Nama Lengkap Anda",
                        hintStyle: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 12,
                          color: const Color(0xffff0d0140).withOpacity(0.6),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 17),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Email",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DM Sans',
                      fontSize: 12,
                      color: Color(0xff0D0140),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email Anda",
                        hintStyle: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 12,
                          color: const Color(0xffff0d0140).withOpacity(0.6),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 17),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Password",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DM Sans',
                          fontSize: 12,
                          color: Color(0xff0D0140),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: passwordController,
                          obscureText: !isPasswordVisible,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 17),
                            suffixIcon: IconButton(
                              icon: isPasswordVisible
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B424C),
                  ),
                  onPressed: registerUser,
                  child: const Text(
                    "DAFTAR",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DM Sans',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sudah Punya Akun? ",
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      color: Color(0xff524B6B),
                      fontSize: 12,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontFamily: 'DM Sans',
                        color: Color(0xffFF9228),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void registerUser() async {
    String email = emailController.text;
    String password = passwordController.text;

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Registration successful, you can use userCredential.user to get user information
      print('User registered: ${userCredential.user?.uid}');

      // Show a toast message
      showToast("Account created successfully");

      // For this example, navigate to the login page after registration
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
    } catch (e) {
      // Registration failed, handle the error
      print('Registration failed: $e');
      showToast("Registration failed: $e");
    }
  }

  // Helper function to show a toast message
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
