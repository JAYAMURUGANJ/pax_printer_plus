// printer_handler.dart
import 'package:pax_printer_plus/pax_printer_plus.dart';
import 'package:pax_printer_plus/utils/printer_status.dart';

/// A helper class that provides simplified access to PAX printer functionality.
///
/// This class wraps the [PaxPrinterPlus] instance and provides convenience methods
/// for common printing operations.
class PaxPrinterPlusHandler {
  /// The underlying printer instance
  final PaxPrinterPlus printer = PaxPrinterPlus();

  /// Initializes the printer.
  ///
  /// Returns a [Future] that completes with a boolean indicating success.
  Future<bool?> initialize() async {
    return await printer.init();
  }

  /// Gets the current status of the printer.
  ///
  /// Returns a [Future] that completes with the printer's [PrinterStatus].
  Future<PrinterStatus> printerStatus() async {
    return await printer.getStatus();
  }

  /// Prints a simple receipt with the given text.
  ///
  /// Parameters:
  /// - [text]: The text content to print.
  ///
  /// Returns a [Future] that completes with the printer's response as a [String].
  Future<String?> printSimpleReceipt(String text) async {
    return await printer.printReceipt(text);
  }

  /// Prints a receipt with text and a QR code.
  ///
  /// Parameters:
  /// - [text]: The text content to print.
  /// - [qrData]: The data to encode in the QR code.
  ///
  /// Returns a [Future] that completes with the printer's response as a [String].
  Future<String?> printReceiptWithQR(String text, String qrData) async {
    return await printer.printReceiptWithQr(text, qrData);
  }

  /// Prints a structured receipt with multiple text sections and a QR code.
  ///
  /// Parameters:
  /// - [header]: The header text of the receipt.
  /// - [body]: The main content of the receipt.
  /// - [footer]: The footer text of the receipt.
  /// - [additionalInfo]: Additional information to include.
  /// - [qrData]: The data to encode in the QR code.
  ///
  /// Returns a [Future] that completes with the printer's response as a [String].
  Future<String?> printStructuredReceipt(
    String header,
    String body,
    String footer,
    String additionalInfo,
    String qrData,
  ) async {
    return await printer.printQRReceipt(
      header,
      body,
      footer,
      additionalInfo,
      qrData,
    );
  }

  /// Prints an image from a URL.
  ///
  /// Parameters:
  /// - [imageUrl]: The URL of the image to print.
  ///
  /// Returns a [Future] that completes with a boolean indicating success.
  Future<bool?> printImage(String imageUrl) async {
    return await printer.printImageUrl(imageUrl);
  }

  /// Prints an image from an asset.
  ///
  /// Parameters:
  /// - [assetPath]: The path to the image asset.
  ///
  /// Returns a [Future] that completes with a boolean indicating success.
  Future<bool?> printImageFromAsset(String assetPath) async {
    return await printer.printImageAsset(assetPath);
  }

  /// Prints a QR code.
  ///
  /// Parameters:
  /// - [data]: The data to encode in the QR code.
  /// - [width]: The width of the QR code in dots.
  /// - [height]: The height of the QR code in dots.
  ///
  /// Returns a [Future] that completes with a boolean indicating success.
  Future<bool?> printQRCode(
    String data, {
    int width = 200,
    int height = 200,
  }) async {
    return await printer.printQRCode(data, width, height);
  }

  /// Feeds the paper by the specified number of steps.
  ///
  /// Parameters:
  /// - [steps]: The number of steps to feed the paper.
  ///
  /// Returns a [Future] that completes with a boolean indicating success.
  Future<bool?> feedPaper(int steps) async {
    return await printer.step(steps);
  }

  /// Cuts the paper.
  ///
  /// Parameters:
  /// - [fullCut]: Whether to perform a full cut (true) or partial cut (false).
  ///
  /// Returns a [Future] that completes with a boolean indicating success.
  Future<bool?> cutPaper({bool fullCut = true}) async {
    return await printer.cutPaper(fullCut ? 0 : 1);
  }

  /// Starts the printing process.
  ///
  /// This method should be called after configuring the print job.
  ///
  /// Returns a [Future] that completes with the printer's response as a [String].
  Future<String?> startPrinting() async {
    return await printer.start();
  }
}
