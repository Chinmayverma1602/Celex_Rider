import 'package:celexapp/Appdrawer/HeaderDrawer.dart';
import 'package:celexapp/Profile/profile_details.dart';
import 'package:celexapp/setting.dart';
import 'package:celexapp/tab_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<bool> _onlineStatus = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('My Orders'),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.red.shade100,
                ),
                child: const TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  tabs: [
                    TabItem(count: 2, title: 'Pick up'),
                    TabItem(count: 1, title: 'Delivered'),
                    TabItem(count: 0, title: 'On the Way'),
                  ],
                ),
              ),
            ),
          ),
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
                HeaderDrawer(onlineStatus: _onlineStatus),
                Divider(thickness: 1),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text(
                    'Home',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
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
        body: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.grey.shade200,
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Column(
                            children: [
                              Text("Premier Honda"),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 40),
                                    child: Text(
                                        'Consignment Number: ${index + 1}'),
                                  ),

                                  /* SizedBox(
                                    width: 50,
                                  ), */
                                  Padding(
                                    padding: const EdgeInsets.only(left: .0),
                                    child: Container(
                                        height: 20,
                                        color: Colors.grey,
                                        child: Text("Quantity:2 ")),
                                  ),
                                  Container(
                                      color: Colors.red, child: Text("W:7.89"))
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Flexible(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                      // height: 20,
                                      color: Colors.black26,
                                      child: Text(
                                        "Salt Lake , Sector-5, Bidhanagar\n,",
                                        style: TextStyle(color: Colors.black),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red, // Fill color
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 60,
                                      vertical: 10), // Button size
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        5), // Rounded corners
                                  ),
                                ),
                                child: Text(
                                  "Pick up",
                                  style: TextStyle(
                                    color: Colors.white, // Text color
                                    fontSize: 16, // Text size
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              color: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
              child: Row(
                children: [
                  Icon(
                    Icons.directions_bus,
                    color: Colors.white,
                    size: 28.0,
                  ),
                  SizedBox(width: 12.0),
                  Text(
                    'Pending Orders',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
