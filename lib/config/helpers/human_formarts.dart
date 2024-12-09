import 'package:intl/intl.dart';

/// Human Formats
/// 
/// This class is used to format numbers to human readable format.
/// 
/// Gonzalo Quedena
class HumanFormats {

  /// Human Readable Number
  /// 
  /// This method is used to format a number to human readable format.
  static String humanReadbleNumber(double number) {
    
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(number);

    return formatterNumber;
  }
}
