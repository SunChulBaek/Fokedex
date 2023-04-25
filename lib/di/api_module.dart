import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class ApiModule {
  Map<String, dynamic> get headers => { };

  BaseOptions get options => BaseOptions(headers: headers);

  PrettyDioLogger get logger => PrettyDioLogger(
      requestHeader: false,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
      compact: true,
      maxWidth: 90
  );

  Dio get dio => Dio(options)..interceptors.add(logger);
}