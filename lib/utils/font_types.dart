/// Represents different font types for ASCII characters.
///
/// This class provides a set of predefined font types that can be used
/// to specify the font size for ASCII characters. Each font type is
/// represented by a unique string value.
class EFontTypeAscii {
  final String _value;
  const EFontTypeAscii._internal(this._value);

  @override
  toString() => _value;

  /// Font type with size 8x16 pixels.
  static const FONT_8_16 = EFontTypeAscii._internal('FONT_8_16');

  /// Font type with size 16x24 pixels.
  static const FONT_16_24 = EFontTypeAscii._internal('FONT_16_24');

  /// Font type with size 12x24 pixels.
  static const FONT_12_24 = EFontTypeAscii._internal('FONT_12_24');

  /// Font type with size 8x32 pixels.
  static const FONT_8_32 = EFontTypeAscii._internal('FONT_8_32');

  /// Font type with size 16x48 pixels.
  static const FONT_16_48 = EFontTypeAscii._internal('FONT_16_48');

  /// Font type with size 12x48 pixels.
  static const FONT_12_48 = EFontTypeAscii._internal('FONT_12_48');

  /// Font type with size 16x16 pixels.
  static const FONT_16_16 = EFontTypeAscii._internal('FONT_16_16');

  /// Font type with size 32x24 pixels.
  static const FONT_32_24 = EFontTypeAscii._internal('FONT_32_24');

  /// Font type with size 24x24 pixels.
  static const FONT_24_24 = EFontTypeAscii._internal('FONT_24_24');

  /// Font type with size 16x32 pixels.
  static const FONT_16_32 = EFontTypeAscii._internal('FONT_16_32');

  /// Font type with size 32x48 pixels.
  static const FONT_32_48 = EFontTypeAscii._internal('FONT_32_48');

  /// Font type with size 24x48 pixels.
  static const FONT_24_48 = EFontTypeAscii._internal('FONT_24_48');
}

/// Represents different font types for extended code characters.
///
/// This class provides a set of predefined font types that can be used
/// to specify the font size for extended code characters. Each font type is
/// represented by a unique string value.
class EFontTypeExtCode {
  final String _value;
  const EFontTypeExtCode._internal(this._value);

  @override
  toString() => _value;

  /// Font type with size 16x16 pixels.
  static const FONT_16_16 = EFontTypeExtCode._internal('FONT_16_16');

  /// Font type with size 24x24 pixels.
  static const FONT_24_24 = EFontTypeExtCode._internal('FONT_24_24');

  /// Font type with size 16x32 pixels.
  static const FONT_16_32 = EFontTypeExtCode._internal('FONT_16_32');

  /// Font type with size 24x48 pixels.
  static const FONT_24_48 = EFontTypeExtCode._internal('FONT_24_48');

  /// Font type with size 32x16 pixels.
  static const FONT_32_16 = EFontTypeExtCode._internal('FONT_32_16');

  /// Font type with size 48x24 pixels.
  static const FONT_48_24 = EFontTypeExtCode._internal('FONT_48_24');

  /// Font type with size 32x32 pixels.
  static const FONT_32_32 = EFontTypeExtCode._internal('FONT_32_32');

  /// Font type with size 48x48 pixels.
  static const FONT_48_48 = EFontTypeExtCode._internal('FONT_48_48');
}
