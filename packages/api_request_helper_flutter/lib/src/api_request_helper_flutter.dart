import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:exceptions_flutter/exceptions_flutter.dart';
import 'package:http/http.dart' as http;

/// {@template api_request_helper_flutter}
/// Api Request Helper Flutter is a repository that handles http calls
/// {@endtemplate}
class ApiRequestHelperFlutter {
  /// {@macro api_request_helper_flutter}
  ApiRequestHelperFlutter();

  final _controller = StreamController<num>();

  /// Convenient getter for status code
  Stream<num> get statusCode async* {
    yield* _controller.stream;
  }

  /// Calls GET api which will emit [Future] Map<String, dynamic>
  ///
  /// Throws a [ExceptionsFlutter] if response status code is not 200
  Future<dynamic> get({
    required Uri uri,
    String? userToken,
  }) async {
    final headers = {
      'Content-Type': 'application/json',
    };

    if (userToken != null) {
      headers.addAll({'Authorization': userToken});
    }

    final response = await http
        .get(
          uri,
          headers: headers,
        )
        .timeout(const Duration(minutes: 1));

    return _returnResponse(response: response, uri: uri);
  }

  /// Calls POST api which will emit [Future] dynamic
  ///
  /// Throws a [ExceptionsFlutter] if response status code is not 200
  Future<dynamic> post({
    required Uri uri,
    required Map<String, dynamic> data,
    String? userToken,
  }) async {
    final headers = {
      'Content-Type': 'application/json',
    };

    if (userToken != null) {
      headers.addAll({'Authorization': userToken});
    }

    final response = await http
        .post(
          uri,
          headers: headers,
          body: jsonEncode(data),
        )
        .timeout(const Duration(minutes: 1));
    return _returnResponse(response: response, uri: uri);
  }

  /// Calls PATCH api which will emit [Future] dynamic
  ///
  /// Throws a [ExceptionsFlutter] if response status code is not 200
  Future<dynamic> patch({
    required Uri uri,
    required Map<String, dynamic> data,
    String? userToken,
  }) async {
    final headers = {
      'Content-Type': 'application/json',
    };

    if (userToken != null) {
      headers.addAll({'Authorization': userToken});
    }

    final response = await http
        .patch(
          uri,
          headers: headers,
          body: jsonEncode(data),
        )
        .timeout(const Duration(minutes: 1));
    return _returnResponse(response: response, uri: uri);
  }

  /// Calls PUT api which will emit [Future] dynamic
  ///
  /// Throws a [ExceptionsFlutter] if response status code is not 200
  Future<dynamic> put({
    required Uri uri,
    required Map<String, dynamic> data,
    String? userToken,
  }) async {
    final headers = {
      'Content-Type': 'application/json',
    };

    if (userToken != null) {
      headers.addAll({'Authorization': userToken});
    }

    final response = await http
        .put(
          uri,
          headers: headers,
          body: jsonEncode(data),
        )
        .timeout(const Duration(minutes: 1));
    return _returnResponse(response: response, uri: uri);
  }

  /// Calls DELETE api which will emit [Future] dynamic
  ///
  /// Throws a [ExceptionsFlutter] if response status code is not 200
  Future<dynamic> delete({
    required Uri uri,
    Map<String, dynamic>? data,
    String? userToken,
  }) async {
    final headers = {
      'Content-Type': 'application/json',
    };

    if (userToken != null) {
      headers.addAll({'Authorization': userToken});
    }

    final response = await http
        .delete(
          uri,
          headers: headers,
          body: jsonEncode(data),
        )
        .timeout(const Duration(minutes: 1));

    return _returnResponse(response: response, uri: uri);
  }

  dynamic _returnResponse({
    required http.Response response,
    required Uri uri,
  }) {
    final num statusCode = response.statusCode;
    final mappedResponse = json.decode(response.body) as Map<String, dynamic>;

    _controller.add(statusCode);

    final emoji = switch (statusCode) {
      != null && >= 200 && < 300 => '✅',
      != null && >= 300 && < 400 => '🟠',
      _ => '❌'
    };

    log('$emoji $statusCode $emoji -- $uri, $mappedResponse');

    switch (statusCode) {
      case 200:
      case 203:
      case 204:
      case 214:
        return mappedResponse;
      default:
        final exception = _getException(
          statusCode: statusCode,
          errorMessage: mappedResponse['message'].toString(),
        );
        throw exception;
    }
  }

  ExceptionsFlutter _getException({
    required num statusCode,
    String? errorMessage,
  }) {
    switch (statusCode) {
      case 301:
        return const ExceptionsFlutter(
          code: 'invalid-credentials',
          message: 'Credentials are invalid',
        );
      case 400:
        return const ExceptionsFlutter(
          code: 'bad-request',
          message: 'The server could not process the request',
        );
      case 401:
        return const ExceptionsFlutter(
          code: 'unauthorized',
          message: 'Could not authorize user',
        );
      case 403:
        return const ExceptionsFlutter(
          code: 'insufficient-permission',
          message: 'User do not have permission',
        );
      case 404:
        return const ExceptionsFlutter(
          code: 'not-found',
          message: 'Could not retrieve resource',
        );
      case 405:
        return const ExceptionsFlutter(
          code: 'method-not-allowed',
          message: 'Could not perform action',
        );
      case 406:
        return const ExceptionsFlutter(
          code: 'not-acceptable',
          message: 'Could not perform action',
        );
      case 408:
        return const ExceptionsFlutter(
          code: 'request-timeout',
          message: 'Request has timed out',
        );
      case 422:
        return const ExceptionsFlutter(
          code: 'unprocessable-entity',
          message: 'Could not process due to possible semantic errors',
        );
      case 429:
        return const ExceptionsFlutter(
          code: 'too-many-requests',
          message: 'Too many requests',
        );
      case 430:
        return const ExceptionsFlutter(
          code: 'security-rejections',
          message: 'Security Rejections',
        );
      case 500:
        return const ExceptionsFlutter(
          code: 'internal-server-error',
          message: 'Server has encountered issue',
        );
      case 502:
        return const ExceptionsFlutter(
          code: 'bad-gateway',
          message: 'Server received invalid response',
        );
      case 503:
        return const ExceptionsFlutter(
          code: 'server-unavailable',
          message: 'Server is not available',
        );
      case 504:
        return const ExceptionsFlutter(
          code: 'gateway-timeout',
          message: 'Server has timed out',
        );
      default:
        throw ExceptionsFlutter(
          code: statusCode.toString(),
          message: errorMessage,
        );
    }
  }

  /// Disposes status code stream controller
  void dispose() => _controller.close();
}
