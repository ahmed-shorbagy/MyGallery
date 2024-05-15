import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_gallery/errors/Faluire_model.dart';
import 'package:my_gallery/models/user_class/user_class.dart';

class ApiService {
  Future<Either<Faluire, UserModel>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      Dio dio = Dio();
      Response response = await dio.post(
        'https://flutter.prominaagency.com/api/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      // Check the status code of the response
      if (response.statusCode == 200) {
        // Convert response data to a JSON string
        String responseData = json.encode(response.data);

        // Parse JSON string using UserModel.fromJson()
        UserModel userModel = UserModel.fromJson(responseData);
        log(responseData);
        log("UserModel: $userModel");
        return Right(userModel);
      } else {
        // Handle bad status code
        print("Bad status code: ${response.statusCode}");
        return Left(ServerFaliure(
            errMessage: "Bad status code: ${response.statusCode}"));
      }
    } catch (e) {
      // Handle other errors
      print("Error occurred during login: $e");
      return Left(ServerFaliure(errMessage: e.toString()));
    }
  }
}
