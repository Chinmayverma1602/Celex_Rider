import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScannerScreen extends StatefulWidget {
  final String shipmentId; // Optional: Pass shipment ID from previous screen

  BarcodeScannerScreen({required this.shipmentId});

  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  String barcode = '';

  @override
  void initState() {
    super.initState();
    _scanBarcode();
  }

  Future<void> _scanBarcode() async {
    try {
      String scannedBarcode = await FlutterBarcodeScanner.scanBarcode(
        '#FF6666', // Color for Android (use a color code or 'null' for default)
        'Cancel', // Text for Android (optional)
        true, // Show flash icon (optional)
        ScanMode.DEFAULT, // Scan mode (default or QR mode)
      );

      if (!mounted) return; // Ensure the state is still mounted

      if (scannedBarcode == '-1') {
        // User pressed 'back' button or cancelled the scan
        Navigator.pop(context);
        return;
      }

      setState(() {
        barcode = scannedBarcode;
      });

      // Handle barcode validation here (compare with widget.shipmentId)
      if (barcode.toLowerCase() == widget.shipmentId.toLowerCase()) {
        // Barcode matched, send back result to previous screen
        Navigator.pop(context, barcode);
      } else {
        // Barcode not matched, show error message or handle as needed
        showDialog(
          context: context,
          barrierDismissible:
              false, // Prevent dialog from dismissing on outside tap
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Barcode does not match. Try again.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                  _scanBarcode(); // Resume scanning
                },
              ),
            ],
          ),
        );
      }
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_NOT_GRANTED') {
        setState(() {
          barcode = 'Camera permission not granted';
        });
      } else {
        setState(() {
          barcode = 'Error: $e';
        });
      }
    } catch (e) {
      setState(() {
        barcode = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Scanned Barcode:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              barcode,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
