import 'dart:typed_data';

import 'pax_printer_plus_platform_interface.dart';
import 'utils/font_types.dart';
import 'utils/printer_status.dart';

/// The main class for the PAX printer plugin.
///
/// This class provides methods to interact with a PAX printer device.
/// It acts as a facade for the platform-specific implementation.
class PaxPrinterPlus {
  /// Gets the platform version.
  Future<String?> getPlatformVersion() {
    return PaxPrinterPlusPlatform.instance.getPlatformVersion();
  }

  /// Gets the current status of the printer.
  ///
  /// Returns a [Future] that completes with the printer status as a [PrinterStatus] enum.
  Future<PrinterStatus> getStatus() {
    return PaxPrinterPlusPlatform.instance.getStatus();
  }

  /// Initializes the printer.
  ///
  /// Returns a [Future] that completes with a boolean indicating the success of the initialization.
  Future<bool?> init() {
    return PaxPrinterPlusPlatform.instance.init();
  }

  /// Sets the font type for ASCII and extended code characters.
  ///
  /// Parameters:
  /// - [asciiFontType]: The font type for ASCII characters.
  /// - [cFontType]: The font type for extended code characters.
  ///
  /// Returns a [Future] that completes with a boolean indicating the success of the operation.
  Future<bool?> fontSet(
    EFontTypeAscii asciiFontType,
    EFontTypeExtCode cFontType,
  ) {
    return PaxPrinterPlusPlatform.instance.fontSet(asciiFontType, cFontType);
  }

  /// Sets the word and line spacing.
  ///
  /// Parameters:
  /// - [wordSpace]: The spacing between words.
  /// - [lineSpace]: The spacing between lines.
  ///
  /// Returns a [Future] that completes with a boolean indicating the success of the operation.
  Future<bool?> spaceSet(int wordSpace, int lineSpace) {
    return PaxPrinterPlusPlatform.instance.spaceSet(wordSpace, lineSpace);
  }

  /// Prints a string with the specified charset.
  ///
  /// Parameters:
  /// - [text]: The text to print.
  /// - [charset]: The character set to use (optional).
  ///
  /// Returns a [Future] that completes with a boolean indicating the success of the operation.
  Future<bool?> printStr(String text, {String? charset}) {
    return PaxPrinterPlusPlatform.instance.printStr(text, charset);
  }

  /// Steps the printer by the specified number of steps.
  ///
  /// Parameters:
  /// - [step]: The number of steps to advance.
  ///
  /// Returns a [Future] that completes with a boolean indicating the success of the operation.
  Future<bool?> step(int step) {
    return PaxPrinterPlusPlatform.instance.step(step);
  }

  /// Prints a bitmap image.
  ///
  /// Parameters:
  /// - [bitmap]: The bitmap data to print.
  ///
  /// Returns a [Future] that completes with a boolean indicating the success of the operation.
  Future<bool?> printBitmap(Uint8List bitmap) {
    return PaxPrinterPlusPlatform.instance.printBitmap(bitmap);
  }

  /// Prints an image from a URL.
  ///
  /// Parameters:
  /// - [url]: The URL of the image to print.
  ///
  /// Returns a [Future] that completes with a boolean indicating the success of the operation.
  Future<bool?> printImageUrl(String url) {
    return PaxPrinterPlusPlatform.instance.printImageUrl(url);
  }

  /// Prints an image from an asset.
  ///
  /// Parameters:
  /// - [img]: The asset path of the image to print.
  ///
  /// Returns a [Future] that completes with a boolean indicating the success of the operation.
  Future<bool?> printImageAsset(String img) {
    return PaxPrinterPlusPlatform.instance.printImageAsset(img);
  }

  /// Prints a QR code with the specified text and dimensions.
  ///
  /// Parameters:
  /// - [text]: The text to encode in the QR code.
  /// - [width]: The width of the QR code.
  /// - [height]: The height of the QR code.
  ///
  /// Returns a [Future] that completes with a boolean indicating the success of the operation.
  Future<bool?> printQRCode(String text, int width, int height) {
    return PaxPrinterPlusPlatform.instance.printQRCode(text, width, height);
  }

  /// Sets the left indentation for printing.
  ///
  /// Parameters:
  /// - [indent]: The left indentation value.
  ///
  /// Returns a [Future] that completes with a boolean indicating the success of the operation.
  Future<bool?> leftIndents(int indent) {
    return PaxPrinterPlusPlatform.instance.leftIndents(indent);
  }

  /// Starts the printer.
  ///
  /// Returns a [Future] that completes with the printer's response as a [String].
  Future<String?> start() {
    return PaxPrinterPlusPlatform.instance.start();
  }

  /// Gets the dot line count.
  ///
  /// Returns a [Future] that completes with the dot line count as an integer.
  Future<int?> getDotLine() {
    return PaxPrinterPlusPlatform.instance.getDotLine();
  }

  /// Sets the gray level for printing.
  ///
  /// Parameters:
  /// - [level]: The gray level value.
  ///
  /// Returns a [Future] that completes with a boolean indicating the success of the operation.
  Future<bool?> setGray(int level) {
    return PaxPrinterPlusPlatform.instance.setGray(level);
  }

  /// Sets the double width mode for printing.
  ///
  /// Parameters:
  /// - [isAscDouble]: Whether to apply double width to ASCII characters.
  /// - [isLocalDouble]: Whether to apply double width to local characters.
  ///
  /// Returns a [Future] that completes with a boolean indicating the success of the operation.
  Future<bool?> setDoubleWidth(bool isAscDouble, bool isLocalDouble) {
    return PaxPrinterPlusPlatform.instance.setDoubleWidth(
      isAscDouble,
      isLocalDouble,
    );
  }

  /// Sets the double height mode for printing.
  ///
  /// Parameters:
  /// - [isAscDouble]: Whether to apply double height to ASCII characters.
  /// - [isLocalDouble]: Whether to apply double height to local characters.
  ///
  /// Returns a [Future] that completes with a boolean indicating the success of the operation.
  Future<bool?> setDoubleHeight(bool isAscDouble, bool isLocalDouble) {
    return PaxPrinterPlusPlatform.instance.setDoubleHeight(
      isAscDouble,
      isLocalDouble,
    );
  }

  /// Sets the invert mode for printing.
  ///
  /// Parameters:
  /// - [isInvert]: Whether to invert the colors during printing.
  ///
  /// Returns a [Future] that completes with a boolean indicating the success of the operation.
  Future<bool?> setInvert(bool isInvert) {
    return PaxPrinterPlusPlatform.instance.setInvert(isInvert);
  }

  /// Cuts the paper.
  ///
  /// Parameters:
  /// - [mode]: The cutting mode.
  ///
  /// Returns a [Future] that completes with a boolean indicating the success of the operation.
  Future<bool?> cutPaper(int mode) {
    return PaxPrinterPlusPlatform.instance.cutPaper(mode);
  }

  /// Prints a receipt with the specified text.
  ///
  /// Parameters:
  /// - [text]: The text content of the receipt.
  ///
  /// Returns a [Future] that completes with the printer's response as a [String].
  Future<String?> printReceipt(String text) {
    return PaxPrinterPlusPlatform.instance.printReceipt(text);
  }

  /// Prints a receipt with the specified text and a QR code.
  ///
  /// Parameters:
  /// - [text]: The text content of the receipt.
  /// - [qrString]: The text to encode in the QR code.
  ///
  /// Returns a [Future] that completes with the printer's response as a [String].
  Future<String?> printReceiptWithQr(String text, String qrString) {
    return PaxPrinterPlusPlatform.instance.printReceiptWithQr(text, qrString);
  }

  /// Prints a receipt with multiple lines of text and a QR code.
  ///
  /// Parameters:
  /// - [text1], [text2], [text3], [text4]: The text lines for the receipt.
  /// - [qrString]: The text to encode in the QR code.
  ///
  /// Returns a [Future] that completes with the printer's response as a [String].
  Future<String?> printQRReceipt(
    String text1,
    String text2,
    String text3,
    String text4,
    String qrString,
  ) {
    return PaxPrinterPlusPlatform.instance.printQRReceipt(
      text1,
      text2,
      text3,
      text4,
      qrString,
    );
  }
}
