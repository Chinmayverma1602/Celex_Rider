import 'package:celexapp/Meter_reading.dart';
import 'package:celexapp/Profile/profile_details.dart';
import 'package:celexapp/Trip_details.dart';
import 'package:celexapp/barcode_scanner.dart';
import 'package:celexapp/delivered_screen.dart';
import 'package:celexapp/history.dart';
import 'package:celexapp/on_the_way_screen.dart';
import 'package:celexapp/returns.dart';
import 'package:celexapp/setting.dart';
import 'package:celexapp/tab_item.dart';
import 'package:celexapp/vehicle_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Appdrawer/HeaderDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  ValueNotifier<bool> _onlineStatus = ValueNotifier<bool>(true);
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'My Orders',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.red.shade100,
              ),
              child: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                tabs: [
                  Tab(
                    child: TabItem(
                      count: 2,
                      title: 'Pick up',
                    ),
                  ),
                  Tab(
                    child: TabItem(
                      count: 1,
                      title: 'Delivered',
                    ),
                  ),
                  Tab(
                    child: TabItem(
                      count: 0,
                      title: 'On the Way',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.grey.shade100,
          child: ListView(
            children: [
              HeaderDrawer(onlineStatus: _onlineStatus),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Home',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
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
                    fontSize: 18,
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
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => VehicleDetails()),
                  );
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
                    fontSize: 18,
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
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => History()));
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
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Returns()));
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
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MeterRedings()));
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
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TripDetails()));
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
                    fontSize: 18,
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
                leading: const Icon(Icons.logout),
                title: Text(
                  'Logout',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomePageScreen(), // Placeholder for Pickup screen content
          DeliveredScreen(),
          OnTheWayScreen(),
        ],
      ),
    );
  }
}

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * .25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade300),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Premier Honda',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '#T936489269562',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ),
                            const SizedBox(
                              width: 60,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.green,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Qt: ",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        '5',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Wt: ',
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        '-2.6',
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Salt Lake,Sec-V,Bidhannagar, New Town\n',
                          style: GoogleFonts.poppins(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BarcodeScannerScreen(
                                        shipmentId: '',
                                      )));
                            },
                            child: Text(
                              'Pick up',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green, // Fill color
                              padding: EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 10),
                            ))
                      ],
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
                Icons.local_shipping,
                color: Colors.white,
                size: 28.0,
              ),
              SizedBox(width: 12.0),
              Text(
                'Pending Orders',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
