import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Returns extends StatefulWidget {
  const Returns({Key? key}) : super(key: key);

  @override
  State<Returns> createState() => _ReturnsState();
}

class _ReturnsState extends State<Returns> {
  // Example boolean to simulate orders presence
  bool hasOrders = false;

  // Simulated function to fetch orders from API
  Future<List<String>> fetchOrdersFromApi() async {
    // Simulate API call delay
    await Future.delayed(Duration(seconds: 2));
    // Simulated response
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Returns',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.24,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.purple.shade200,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.local_shipping_rounded,
                      size: 30,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Total Pending Delivery",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '0',
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Latest Delivery',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20), // Adjust the height as needed
            Text(
              'Recent Orders',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Conditional display based on fetching orders
            FutureBuilder<List<String>>(
              future: fetchOrdersFromApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // While fetching data
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // If error occurred
                  return Center(child: Text('Error fetching orders.'));
                } else {
                  // Data fetched successfully
                  List<String> orders = snapshot.data ?? [];
                  if (orders.isEmpty) {
                    // No orders scenario
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 120.0),
                        child: Text(
                          "You don't have any orders so far.",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    );
                  } else {
                    // Display orders
                    return Column(
                      children: orders.map((order) => Text(order)).toList(),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
