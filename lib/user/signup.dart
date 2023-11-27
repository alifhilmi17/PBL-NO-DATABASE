import 'package:flutter/material.dart';
import 'package:pbl/user/login.dart';

void main() {
  runApp(const SignUp());
}

class SignUp extends StatelessWidget {
  const SignUp({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, Key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC0DCDD),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Create an Account",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DM Sans',
                  fontSize: 30,
                  color: Color(0xff0D0140),
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontSize: 12,
                  color: Color(0xff524B6B),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 64,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Your Full Name",
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Your Email",
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
                    mainAxisAlignment: MainAxisAlignment.start,
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
              Row(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Add logic you want to execute when the checkbox changes
                        },
                        activeColor: const Color(0xff130160),
                        checkColor: const Color(0xFF5972A5),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        "Remember me",
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 12,
                          color: Color(0xFF5972A5),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 60),
                  const Text(
                    "Forgot Password ?",
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 12,
                      color: Color(0xff0D0140),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B424C),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    );
                  },
                  child: const Text(
                    "SIGN UP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DM Sans',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 19),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFCF7DA),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://static-00.iconduck.com/assets.00/google-icon-2048x2048-czn3g8x8.png",
                        height: 20,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        "SIGN IN WITH GOOGLE",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DM Sans',
                          color: Color(0xff0D0140),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "You already have an account? ",
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
}
