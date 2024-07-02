import 'package:celexapp/Appdrawer/HeaderDrawer.dart';
import 'package:celexapp/Profile/profile_details.dart';
import 'package:celexapp/change_password.dart';
import 'package:celexapp/homepage.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  ValueNotifier<bool> onlineStatus = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.orange.shade700,
                Colors.orange.shade600,
                Colors.orange.shade200,
              ],
            ),
          ),
          child: ListView(
            children: [
              HeaderDrawer(onlineStatus: onlineStatus),
              Divider(thickness: 1),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Home',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomePage()),
                  ); // Close the drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text(
                  'My Profile',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.fire_truck),
                title: Text(
                  'Vehicle Details',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.document_scanner),
                title: Text(
                  'Documents',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text(
                  'History',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.keyboard_return_sharp),
                title: Text(
                  'Returns',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.location_on_sharp),
                title: Text(
                  'Meter Readings',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text(
                  'Trip Summary [Beta]',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'Setting',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Logout',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            _buildSettingOption(
              context,
              'Theme',
              trailing: Switch(
                value: true,
                onChanged: (value) {},
                activeColor: Colors.green,
              ),
              onTap: () {},
            ),
            Divider(),
            _buildSettingOption(
              context,
              'Change Password',
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                );
              },
            ),
            Divider(),
            _buildSettingOption(
              context,
              'Privacy Policy',
              onTap: () {},
            ),
            Divider(),
            _buildSettingOption(
              context,
              'Terms & Conditions',
              onTap: () {},
            ),
            Divider(),
            _buildSettingOption(
              context,
              'Contact Us',
              subtitle: 'contact@company.com',
              onTap: () {},
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingOption(BuildContext context, String title,
      {Widget? trailing, String? subtitle, required VoidCallback onTap}) {
    return ListTile(
      title: Text(title, style: TextStyle(fontSize: 18)),
      trailing: trailing,
      subtitle: subtitle != null ? Text(subtitle) : null,
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      onTap: onTap,
    );
  }
}
