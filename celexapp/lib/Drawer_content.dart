import 'package:celexapp/Appdrawer/HeaderDrawer.dart';
import 'package:celexapp/Profile/profile_details.dart';
import 'package:flutter/material.dart';

class Drawer extends StatefulWidget {
  const Drawer({super.key});

  @override
  State<Drawer> createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  final ValueNotifier<bool> _onlineStatus = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.deepPurple.shade200,
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
          HeaderDrawer(
            onlineStatus: _onlineStatus,
          ),
/*               DrawerHeader(
                  child: Center(
                      child: Text(
                'L O G O',
                style: TextStyle(
                  fontSize: 35,
                ),
              )
              )
              ), */
              
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(
              'My Profile',
              style: TextStyle(
                fontSize: 20,
              ),
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
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.document_scanner),
            title: Text(
              'Documents',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text(
              'History',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.keyboard_return_sharp),
            title: Text(
              'Returns',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on_sharp),
            title: Text(
              'Meter Readings',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text(
              'Trip Summary [Beta]',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Setting',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
