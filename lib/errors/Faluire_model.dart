import 'package:dio/dio.dart';

abstract class Faluire {
  final String errMessage;

  Faluire({required this.errMessage});
}

class ServerFaliure extends Faluire {
  ServerFaliure({required super.errMessage});
  factory ServerFaliure.fromDioErr(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFaliure(errMessage: 'Connection time out with the server');
      case DioExceptionType.cancel:
        return ServerFaliure(errMessage: 'Request to server was cancled');
      case DioExceptionType.connectionError:
        return ServerFaliure(errMessage: 'Connection time out with the server');
      case DioExceptionType.sendTimeout:
        return ServerFaliure(
            errMessage:
                'send time out with the server, please try again later!');
      case DioExceptionType.receiveTimeout:
        return ServerFaliure(
            errMessage:
                'recieve time out with the server, please try again later!');
      case DioExceptionType.badResponse:
        return ServerFaliure.fromResponce(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFaliure(errMessage: 'No Internet Connection');
        }
        return ServerFaliure(
            errMessage: 'Un Expected Error please try again later');
      default:
        return ServerFaliure(
            errMessage: 'Oops there was an error, please try again later!');
    }
  }
  factory ServerFaliure.fromResponce(int statusCode, dynamic responce) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFaliure(errMessage: responce['error']['message']);
    } else if (statusCode == 404) {
      return ServerFaliure(
          errMessage: 'Your request not found, please try again later!');
    } else if (statusCode == 500) {
      return ServerFaliure(
          errMessage: 'Internal server proplem, please try again later!');
    } else {
      return ServerFaliure(
          errMessage: 'Oops there was an error, please try again later!');
    }
  }
}
