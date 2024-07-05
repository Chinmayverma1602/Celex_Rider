import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveredScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No orders delivered so far.',
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
