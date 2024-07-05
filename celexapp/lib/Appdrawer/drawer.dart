import 'package:celexapp/Appdrawer/HeaderDrawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:celexapp/Profile/profile_details.dart';
import 'package:celexapp/setting.dart';

class DrawerDetails extends StatelessWidget {
  final ValueNotifier<bool> onlineStatus;

  const DrawerDetails({Key? key, required this.onlineStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            color: Colors.grey.shade100,
            child: ListView(padding: EdgeInsets.zero, children: [
              HeaderDrawer(onlineStatus: onlineStatus),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Home',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
              Divider(
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text(
                  'My Profile',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              Divider(
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.fire_truck),
                title: Text(
                  'Vehicle Details',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              Divider(
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.document_scanner),
                title: Text(
                  'Documents',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              Divider(
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text(
                  'History',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              Divider(
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.keyboard_return_sharp),
                title: Text(
                  'Returns',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              Divider(
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.location_on_sharp),
                title: Text(
                  'Meter Readings',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              Divider(
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text(
                  'Trip Summary [Beta]',
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              Divider(
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'Setting',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
              ),
              Divider(
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Logout',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ])));
  }
}
