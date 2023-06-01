import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class ApiModule {
  Map<String, dynamic> get headers => { };

  BaseOptions get options => BaseOptions(headers: headers);

  PrettyDioLogger get logger => PrettyDioLogger(
      requestHeader: false,
      requestBody: false,
      responseHeader: false,
      responseBody: false,
      error: false,
      compact: true,
      maxWidth: 90
  );

  Dio get dio => Dio(options)..interceptors.add(logger);
}