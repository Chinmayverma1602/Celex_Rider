import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleDetails extends StatefulWidget {
  const VehicleDetails({Key? key}) : super(key: key);

  @override
  State<VehicleDetails> createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          'Vehicle Details',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vehicle Type',
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 80.0),
              child: Text(
                "Car",
                style: GoogleFonts.poppins(),
              ),
            ),
            SizedBox(height: 20), // Spacer between sections
            Text(
              'Manufacturer',
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 80.0),
              child: Text(
                "Enter the Manufacturer company",
                style: GoogleFonts.poppins(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Model',
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Enter the Model',
              style: GoogleFonts.poppins(),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Year',
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '0',
              style: GoogleFonts.poppins(),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'License Number',
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5),
            Text(
              'Enter the license Number',
              style: GoogleFonts.poppins(),
            ),
            SizedBox(height: 20),
            Text(
              'Color',
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Enter the Vehicle color',
              style: GoogleFonts.poppins(),
            )
          ],
        ),
      ),
    );
  }
}
