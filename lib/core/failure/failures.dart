import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return ServerFailure('Connection Timeout from Api Services');

      case DioErrorType.sendTimeout:
        return ServerFailure('Send Timeout from Api Services');

      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive Timeout from Api Services');

      case DioErrorType.response:
        return ServerFailure.fromResponse(dioError.response!.data);

      case DioErrorType.cancel:
        return ServerFailure('Request to Api Services was canceled');

      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          return ServerFailure('No Internet Connection!');
        }
        return ServerFailure('Try again later!');

      default:
        return ServerFailure('Try again later!');
    }
  }

  factory ServerFailure.fromResponse(Map<String, dynamic>? response) {

      return ServerFailure(response!['message']);

  }
}
