import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'pax_printer_plus_platform_interface.dart';
import 'utils/font_types.dart';
import 'utils/printer_status.dart';

/// An implementation of [PaxPrinterPlusPlatform] that uses method channels.
class MethodChannelPaxPrinterPlus extends PaxPrinterPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_pax_printer_utility');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }

  @override
  Future<PrinterStatus> getStatus() async {
    final String? status = await methodChannel.invokeMethod<String>(
      'getStatus',
    );
    switch (status) {
      case "Success":
        return PrinterStatus.SUCCESS;
      case "Printer is busy":
        return PrinterStatus.PRINTER_IS_BUSY;
      case "Out of paper":
        return PrinterStatus.OUT_OF_PAPER;
      case "The format of print data packet error":
        return PrinterStatus.FORMAT_PRINT_PACKET_ERROR;
      case "Printer malfunctions":
        return PrinterStatus.PRINTER_MALFUCTION;
      case "Printer over heats":
        return PrinterStatus.PRINTER_OVER_HEATS;
      case "Printer voltage is too low":
        return PrinterStatus.PRINTER_VOLTAGE_IS_TO_LOW;
      case "Printing is unfinished":
        return PrinterStatus.PRINTING_IS_UNFINISHED;
      case "The printer has not installed font library":
        return PrinterStatus.FONT_LIBRARY_NOT_INSTALLED;
      case "Data package is too long":
        return PrinterStatus.DATA_PACKAGE_TO_LONG;
      default:
        return PrinterStatus.UNKNOWN;
    }
  }

  @override
  Future<bool?> init() async {
    return await methodChannel.invokeMethod<bool>('init');
  }

  @override
  Future<bool?> fontSet(
    EFontTypeAscii asciiFontType,
    EFontTypeExtCode cFontType,
  ) async {
    Map<String, dynamic> arguments = {
      "asciiFontType": asciiFontType.toString(),
      "cFontType": cFontType.toString(),
    };
    return await methodChannel.invokeMethod<bool>('fontSet', arguments);
  }

  @override
  Future<bool?> spaceSet(int wordSpace, int lineSpace) async {
    Map<String, dynamic> arguments = {
      "wordSpace": wordSpace.toString(),
      "lineSpace": lineSpace.toString(),
    };
    return await methodChannel.invokeMethod<bool>('spaceSet', arguments);
  }

  @override
  Future<bool?> printStr(String text, String? charset) async {
    Map<String, dynamic> arguments = {"text": text, "charset": charset};
    return await methodChannel.invokeMethod<bool>('printStr', arguments);
  }

  @override
  Future<bool?> step(int step) async {
    Map<String, dynamic> arguments = {"step": step};
    return await methodChannel.invokeMethod<bool>('step', arguments);
  }

  @override
  Future<bool?> printBitmap(Uint8List bitmap) async {
    Map<String, dynamic> arguments = {"bitmap": bitmap};
    return await methodChannel.invokeMethod<bool>('printBitmap', arguments);
  }

  @override
  Future<bool?> printImageUrl(String url) async {
    Map<String, dynamic> arguments = {"url": url};
    return await methodChannel.invokeMethod<bool>('printImageUrl', arguments);
  }

  @override
  Future<bool?> printImageAsset(String img) async {
    final ByteData fileData = await rootBundle.load(img);
    final Uint8List byte = fileData.buffer.asUint8List(
      fileData.offsetInBytes,
      fileData.lengthInBytes,
    );

    Map<String, dynamic> arguments = {"bitmap": byte};
    return await methodChannel.invokeMethod<bool>('printImageAsset', arguments);
  }

  @override
  Future<bool?> printQRCode(String text, int width, int height) async {
    Map<String, dynamic> arguments = {
      "text": text,
      "width": width,
      "height": height,
    };
    return await methodChannel.invokeMethod<bool>('printQRCode', arguments);
  }

  @override
  Future<bool?> leftIndents(int indent) async {
    Map<String, dynamic> arguments = {"indent": indent};
    return await methodChannel.invokeMethod<bool>('leftIndents', arguments);
  }

  @override
  Future<String?> start() async {
    return await methodChannel.invokeMethod<String>('start');
  }

  @override
  Future<int?> getDotLine() async {
    return await methodChannel.invokeMethod<int>('getDotLine');
  }

  @override
  Future<bool?> setGray(int level) async {
    Map<String, dynamic> arguments = {"level": level};
    return await methodChannel.invokeMethod<bool>('setGray', arguments);
  }

  @override
  Future<bool?> setDoubleWidth(bool isAscDouble, bool isLocalDouble) async {
    Map<String, dynamic> arguments = {
      "isAscDouble": isAscDouble,
      "isLocalDouble": isLocalDouble,
    };
    return await methodChannel.invokeMethod<bool>('setDoubleWidth', arguments);
  }

  @override
  Future<bool?> setDoubleHeight(bool isAscDouble, bool isLocalDouble) async {
    Map<String, dynamic> arguments = {
      "isAscDouble": isAscDouble,
      "isLocalDouble": isLocalDouble,
    };
    return await methodChannel.invokeMethod<bool>('setDoubleHeight', arguments);
  }

  @override
  Future<bool?> setInvert(bool isInvert) async {
    Map<String, dynamic> arguments = {"isInvert": isInvert};
    return await methodChannel.invokeMethod<bool>('setInvert', arguments);
  }

  @override
  Future<bool?> cutPaper(int mode) async {
    Map<String, dynamic> arguments = {"mode": mode};
    return await methodChannel.invokeMethod<bool>('cutPaper', arguments);
  }

  @override
  Future<String?> printReceipt(String text) async {
    final String? response = await methodChannel.invokeMethod<String>(
      'printReceipt',
      {"text": text.replaceAll("\r", "")},
    );
    return response;
  }

  @override
  Future<String?> printReceiptWithQr(String text, String qrString) async {
    final String? response = await methodChannel.invokeMethod<String>(
      'printReceipt',
      {"text": text.replaceAll("\r", ""), "qr_string": qrString},
    );
    return response;
  }

  @override
  Future<String?> printQRReceipt(
    String text1,
    String text2,
    String text3,
    String text4,
    String qrString,
  ) async {
    Map<String, dynamic> arguments = {
      "text1": text1.replaceAll("\r", ""),
      "text2": text2.replaceAll("\r", ""),
      "text3": text3.replaceAll("\r", ""),
      "text4": text4.replaceAll("\r", ""),
      "qr_string": qrString,
    };
    final String? response = await methodChannel.invokeMethod<String>(
      'printQR',
      arguments,
    );
    return response;
  }
}
