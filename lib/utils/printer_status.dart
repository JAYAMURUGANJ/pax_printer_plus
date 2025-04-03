/// Represents the status of a printer.
///
/// This enum provides a set of predefined status values that can be returned
/// by the printer to indicate its current state.
enum PrinterStatus {
  /// The printer status is unknown.
  UNKNOWN,

  /// The operation was successful.
  SUCCESS,

  /// The printer is currently busy processing a previous operation.
  PRINTER_IS_BUSY,

  /// The printer is out of paper.
  OUT_OF_PAPER,

  /// The format of the print data packet is incorrect.
  FORMAT_PRINT_PACKET_ERROR,

  /// The printer is experiencing a malfunction.
  PRINTER_MALFUCTION,

  /// The printer is overheating.
  PRINTER_OVER_HEATS,

  /// The printer's voltage is too low for proper operation.
  PRINTER_VOLTAGE_IS_TO_LOW,

  /// The printing operation is not yet complete.
  PRINTING_IS_UNFINISHED,

  /// The printer's font library has not been installed.
  FONT_LIBRARY_NOT_INSTALLED,

  /// The data package size exceeds the maximum allowed.
  DATA_PACKAGE_TO_LONG,
}
