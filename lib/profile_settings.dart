import 'package:flutter/material.dart';
import 'package:pbl/password_update.dart';
import 'profile_page.dart';

void main() {
  runApp(MaterialApp(
    home: ProfileSettingsPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class ProfileSettingsPage extends StatefulWidget {
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
                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            // Bagian Notification
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: Icon(
                  Icons.lock_outline_rounded,
                  color: Color(0xFF150B3D),
                ),
                title: Text(
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

            SizedBox(height: 20),
            // Bagian "Password"
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: Icon(
                  Icons.lock_outline_rounded,
                  color: Color(0xFF150B3D),
                ),
                title: Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF150B3D),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color(0xFF150B3D),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangePasswordPage(),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            // Bagian "Log Out"
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: Icon(
                  Icons.logout,
                  color: Color(0xFF150B3D),
                ),
                title: Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF150B3D),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color(0xFF150B3D),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(50)),
                      ),
                      builder: (BuildContext context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.40,
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(50)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 40.0),
                              Text(
                                'LOG OUT',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF150B3D),
                                ),
                              ),
                              SizedBox(height: 25.0),
                              Text(
                                'Are you sure you want to leave?',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF150B3D),
                                ),
                              ),
                              SizedBox(height: 40.0),
                              ElevatedButton(
                                onPressed: () {
                                  print('User clicked YES');
                                },
                                style: ButtonStyle(
                                  fixedSize:
                                      MaterialStateProperty.all(Size(350, 50)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFF1B424C)),
                                ),
                                child: Text('YES'),
                              ),
                              SizedBox(height: 30.0),
                              ElevatedButton(
                                onPressed: () {
                                  print('User clicked NO');
                                },
                                style: ButtonStyle(
                                  fixedSize:
                                      MaterialStateProperty.all(Size(350, 50)),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.cyan),
                                ),
                                child: Text('NO'),
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
