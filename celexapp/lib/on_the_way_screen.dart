import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnTheWayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No orders on the way.',
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
