// ignore_for_file: avoid_dynamic_calls

import 'package:dio/dio.dart';
import 'package:easix/easix.dart';

/// ServerError class

class ServerErrorsArc extends Failure {
  /// ServerError constructor
  const ServerErrorsArc({
    required super.message,
    super.stackTrace,
    super.statusCode,
    this.errors,
  });

  /// ServerError message
  final List<dynamic>? errors;

  @override
  List<Object?> get props => [super.props, errors];
}

List<dynamic> _formatErrors(Map<String, dynamic> errors) {
  final errorList = <String>[];

  for (final key in errors.keys) {
    for (final error in errors[key]! as List<dynamic>) {
      errorList.add('- $error');
    }
  }

  return errorList;
}

/// handleError function
(Failure, T?) handleError<T>(DioException error) {
  final failure = ServerErrorsArc(
    message: error.response?.data['message'].toString() ??
        error.message ??
        'Unknown Error',
    errors: error.response?.data['errors'] != null
        ? _formatErrors(
            error.response?.data['errors'] as Map<String, dynamic>,
          )
        : null,
    statusCode: error.response?.statusCode ?? 0,
  );
  return (failure, null);
}
