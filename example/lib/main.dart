import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pax_printer_plus/utils/printer_status.dart';

import 'pax_printer_plus_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Wrap with MaterialApp that provides ScaffoldMessenger
      home: const PrinterPage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    );
  }
}

// Create a separate page widget to handle printer operations
class PrinterPage extends StatefulWidget {
  const PrinterPage({super.key});

  @override
  State<PrinterPage> createState() => _PrinterPageState();
}

class _PrinterPageState extends State<PrinterPage> {
  String _printerStatus = 'Unknown';

  // Use the handler instead of the plugin directly
  final _printerHandler = PaxPrinterPlusHandler();

  @override
  void initState() {
    super.initState();
    initPrinterState();
  }

  // Initialize printer and get platform info
  Future<void> initPrinterState() async {
    String platformVersion;
    String printerStatus;

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      // Initialize the printer
      await _printerHandler.initialize();
      // Get printer status
      PrinterStatus status = await _printerHandler.printerStatus();
      printerStatus = status.toString().split('.').last;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
      printerStatus = 'Failed to get printer status.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _printerStatus = printerStatus;
    });
  }

  // Print a sample receipt
  Future<void> printSampleReceipt() async {
    try {
      final result = await _printerHandler.printSimpleReceipt(
        "Sample Receipt\n\n"
        "Date: ${DateTime.now()}\n"
        "Item 1: \$10.00\n"
        "Item 2: \$15.50\n"
        "Total: \$25.50\n\n"
        "Thank you for your purchase!",
      );
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Print result: $result')));
      }

      // Update printer status after printing
      final status = await _printerHandler.printerStatus();
      setState(() {
        _printerStatus = status.toString().split('.').last;
      });
    } on PlatformException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: ${e.message}')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PAX Printer Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Printer status: $_printerStatus'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: printSampleReceipt,
              child: const Text('Print Sample Receipt'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final status = await _printerHandler.printerStatus();
                setState(() {
                  _printerStatus = status.toString().split('.').last;
                });
              },
              child: const Text('Check Printer Status'),
            ),
          ],
        ),
      ),
    );
  }
}
