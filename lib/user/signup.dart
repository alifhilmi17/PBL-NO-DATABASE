import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isPasswordVisible = false;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    businessNameController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> registerUser() async {
    String email = emailController.text;
    String password = passwordController.text;

    // Check if the password meets the minimum length requirement
    if (password.length < 8) {
      showToast("Password must be at least 8 characters");
      return;
    }

    // Check if the password and confirm password match
    if (password != confirmPasswordController.text) {
      showToast("Password and Confirm Password do not match");
      return;
    }

    // Check if the password contains at least one capital letter and one digit
    if (!RegExp(r'(?=.*[A-Z])(?=.*[0-9])').hasMatch(password)) {
      showToast(
          "Password must contain at least one capital letter and one digit");
      return;
    }

    try {
      final auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await addUser(
        fullNameController.text,
        emailController.text,
        passwordController.text,
        businessNameController.text,
        phoneNumberController.text,
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

  Future<void> addUser(
    String fullName,
    String email,
    String password,
    String businessName, // Added business name parameter
    String phoneNumber, // Added phone number parameter
  ) async {
    // Hash the password using SHA-256
    final passwordBytes = utf8.encode(password);
    final hashedPassword = sha256.convert(passwordBytes).toString();

    await FirebaseFirestore.instance.collection('users').add({
      'full_name': fullName,
      'email': email,
      'password': hashedPassword,
      'business_name': businessName, // Added business name field
      'phone_number': phoneNumber, // Added phone number field
    });
  }

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
                  buildTextField(
                      "Full Name", fullNameController, "Nama Lengkap Anda"),
                  const SizedBox(height: 15),
                  buildTextField("Email", emailController, "Email Anda"),
                  const SizedBox(height: 15),
                  buildTextField(
                      "Business Name", businessNameController, "Nama Usaha"),
                  const SizedBox(height: 15),
                  buildTextField(
                      "Phone Number", phoneNumberController, "Nomor Telepon"),
                  const SizedBox(height: 15),
                  buildPasswordField(
                    "Password",
                    passwordController,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              // Add Confirm Password Field
              buildPasswordField("Confirm Password", confirmPasswordController),
              SizedBox(
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

  Widget buildTextField(
      String label, TextEditingController controller, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
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
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                fontFamily: 'DM Sans',
                fontSize: 12,
                color: Color(0xffff0d0140),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPasswordField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
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
            controller: controller,
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
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
    );
  }

  // Helper function to show a toast message
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
