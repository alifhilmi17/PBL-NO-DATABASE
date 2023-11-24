import 'package:flutter/material.dart';
import 'package:pbl/user/password_update.dart';
import 'profile_page.dart';

void main() {
  runApp(const MaterialApp(
    home: ProfileSettingsPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Bagian Notification
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: const Icon(
                  Icons.lock_outline_rounded,
                  color: Color(0xFF150B3D),
                ),
                title: const Text(
                  'Enable Notification',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF150B3D),
                  ),
                ),
                trailing: Switch(
                  value: notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      notificationsEnabled = value;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
            ),

            const SizedBox(height: 20),
            // Bagian "Password"
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: const Icon(
                  Icons.lock_outline_rounded,
                  color: Color(0xFF150B3D),
                ),
                title: const Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF150B3D),
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color(0xFF150B3D),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangePasswordPage(),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Bagian "Log Out"
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: const Icon(
                  Icons.logout,
                  color: Color(0xFF150B3D),
                ),
                title: const Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF150B3D),
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color(0xFF150B3D),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(50)),
                      ),
                      builder: (BuildContext context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.40,
                          padding: const EdgeInsets.all(16.0),
                          decoration: const BoxDecoration(
                            color: Color(0xFFC0DCDD),
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(50)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 40.0),
                              const Text(
                                'LOG OUT',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF150B3D),
                                ),
                              ),
                              const SizedBox(height: 25.0),
                              const Text(
                                'Are you sure you want to leave?',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF150B3D),
                                ),
                              ),
                              const SizedBox(height: 40.0),
                              ElevatedButton(
                                onPressed: () {
                                  print('User clicked YES');
                                },
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all(
                                      const Size(350, 50)),
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFF1B424C)),
                                ),
                                child: const Text(
                                  'YES',
                                  style: TextStyle(
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              ElevatedButton(
                                onPressed: () {
                                  print('User clicked NO');
                                },
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all(
                                      const Size(350, 50)),
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFFFCF7DB),
                                  ),
                                ),
                                child: const Text(
                                  'CANCEL',
                                  style: TextStyle(
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
