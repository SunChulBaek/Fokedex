import 'package:logger/logger.dart';

class Timber {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      printEmojis: false
    )
  );

  static void v(dynamic message) => _logger.v(message);

  static void i(dynamic message) => _logger.i(message);

  static void d(dynamic message) => _logger.d(message);

  static void w(dynamic message) => _logger.w(message);

  static void e(dynamic message) => _logger.e(message);
}