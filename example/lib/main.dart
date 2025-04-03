import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pax_printer_plus/utils/printer_status.dart';

import 'utils/pax_printer_plus_handler.dart';

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
  bool _isPrinterInitialized = false; // Track printer initialization status
  final _printerHandler = PaxPrinterPlusHandler();

  @override
  void initState() {
    super.initState();
    initPrinterState();
    getPrinterStatus();
  }

  // Initialize printer and get platform info
  Future<void> initPrinterState() async {
    try {
      // Initialize the printer
      await _printerHandler.initialize();
      setState(() {
        _isPrinterInitialized = true; // Mark as initialized
      });
      // Get initial printer status
      await getPrinterStatus();
    } on PlatformException {
      setState(() {
        _printerStatus = 'Initialization Failed!';
        _isPrinterInitialized = false;
      });
    }
  }

  // Get printer status only if initialized
  Future<void> getPrinterStatus() async {
    if (!_isPrinterInitialized) return;

    try {
      PrinterStatus status = await _printerHandler.printerStatus();
      setState(() {
        _printerStatus = status.toString().split('.').last;
      });
    } on PlatformException {
      setState(() {
        _printerStatus = 'Failed to get printer status.';
      });
    }
  }

  // Print a sample receipt
  Future<void> printSampleReceipt() async {
    if (!_isPrinterInitialized) {
      showSnackBar('Printer not initialized!');
      return;
    }

    try {
      final result = await _printerHandler.printSimpleReceipt(
        "Sample Receipt\n\n"
        "Date: ${DateTime.now()}\n"
        "Item 1: \$10.00\n"
        "Item 2: \$15.50\n"
        "Total: \$25.50\n\n"
        "Thank you for your purchase!",
      );

      showSnackBar('Print result: $result');

      // Update printer status after printing
      await getPrinterStatus();
    } on PlatformException catch (e) {
      showSnackBar('Error: ${e.message}');
    }
  }

  // Show message using SnackBar
  void showSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.print_rounded),
        title: const Text('PAX Printer Plus'),
        actions: [
          Visibility(
            visible: _isPrinterInitialized,
            child: IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () => getPrinterStatus(),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Printer status: $_printerStatus'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isPrinterInitialized ? printSampleReceipt : null,
              child: const Text('Print Sample Receipt'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _isPrinterInitialized ? getPrinterStatus : null,
              child: const Text('Check Printer Status'),
            ),
          ],
        ),
      ),
    );
  }
}
