import 'dart:async';
import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'utils/font_types.dart';
import 'pax_printer_plus_method_channel.dart';
import 'utils/printer_status.dart';

/// The interface that implementations of pax_printer_plus must implement.
///
/// Platform implementations should extend this class rather than implement it as `PaxPrinterPlus`
/// does not consider newly added methods to be breaking changes. Extending this class
/// (using `extends`) ensures that the subclass will get the default implementation, while
/// platform implementations that `implements` this interface will be broken by newly added
/// [PaxPrinterPlusPlatform] methods.
abstract class PaxPrinterPlusPlatform extends PlatformInterface {
  /// Constructs a PaxPrinterPlusPlatform.
  PaxPrinterPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static PaxPrinterPlusPlatform _instance = MethodChannelPaxPrinterPlus();

  /// The default instance of [PaxPrinterPlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelPaxPrinterPlus].
  static PaxPrinterPlusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PaxPrinterPlusPlatform] when
  /// they register themselves.
  static set instance(PaxPrinterPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Gets the platform version.
  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// Gets the current printer status.
  Future<PrinterStatus> getStatus() {
    throw UnimplementedError('getStatus() has not been implemented.');
  }

  /// Initializes the printer.
  Future<bool?> init() {
    throw UnimplementedError('init() has not been implemented.');
  }

  /// Sets the font type for printing.
  Future<bool?> fontSet(
    EFontTypeAscii asciiFontType,
    EFontTypeExtCode cFontType,
  ) {
    throw UnimplementedError('fontSet() has not been implemented.');
  }

  /// Sets the word and line spacing.
  Future<bool?> spaceSet(int wordSpace, int lineSpace) {
    throw UnimplementedError('spaceSet() has not been implemented.');
  }

  /// Prints a string with the specified charset.
  Future<bool?> printStr(String text, String? charset) {
    throw UnimplementedError('printStr() has not been implemented.');
  }

  /// Steps the printer by the specified number of steps.
  Future<bool?> step(int step) {
    throw UnimplementedError('step() has not been implemented.');
  }

  /// Prints a bitmap image.
  Future<bool?> printBitmap(Uint8List bitmap) {
    throw UnimplementedError('printBitmap() has not been implemented.');
  }

  /// Prints an image from a URL.
  Future<bool?> printImageUrl(String url) {
    throw UnimplementedError('printImageUrl() has not been implemented.');
  }

  /// Prints an image from an asset.
  Future<bool?> printImageAsset(String img) {
    throw UnimplementedError('printImageAsset() has not been implemented.');
  }

  /// Prints a QR code with the specified text and dimensions.
  Future<bool?> printQRCode(String text, int width, int height) {
    throw UnimplementedError('printQRCode() has not been implemented.');
  }

  /// Sets the left indentation for printing.
  Future<bool?> leftIndents(int indent) {
    throw UnimplementedError('leftIndents() has not been implemented.');
  }

  /// Starts the printer.
  Future<String?> start() {
    throw UnimplementedError('start() has not been implemented.');
  }

  /// Gets the dot line count.
  Future<int?> getDotLine() {
    throw UnimplementedError('getDotLine() has not been implemented.');
  }

  /// Sets the gray level for printing.
  Future<bool?> setGray(int level) {
    throw UnimplementedError('setGray() has not been implemented.');
  }

  /// Sets the double width mode for printing.
  Future<bool?> setDoubleWidth(bool isAscDouble, bool isLocalDouble) {
    throw UnimplementedError('setDoubleWidth() has not been implemented.');
  }

  /// Sets the double height mode for printing.
  Future<bool?> setDoubleHeight(bool isAscDouble, bool isLocalDouble) {
    throw UnimplementedError('setDoubleHeight() has not been implemented.');
  }

  /// Sets the invert mode for printing.
  Future<bool?> setInvert(bool isInvert) {
    throw UnimplementedError('setInvert() has not been implemented.');
  }

  /// Cuts the paper.
  Future<bool?> cutPaper(int mode) {
    throw UnimplementedError('cutPaper() has not been implemented.');
  }

  /// Prints a receipt with the specified text.
  Future<String?> printReceipt(String text) {
    throw UnimplementedError('printReceipt() has not been implemented.');
  }

  /// Prints a receipt with the specified text and a QR code.
  Future<String?> printReceiptWithQr(String text, String qrString) {
    throw UnimplementedError('printReceiptWithQr() has not been implemented.');
  }

  /// Prints a receipt with multiple lines of text and a QR code.
  Future<String?> printQRReceipt(
    String text1,
    String text2,
    String text3,
    String text4,
    String qrString,
  ) {
    throw UnimplementedError('printQRReceipt() has not been implemented.');
  }
}
