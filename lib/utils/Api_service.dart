import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_gallery/errors/Faluire_model.dart';
import 'package:my_gallery/models/my_gallery_model/my_gallery_model.dart';
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
        log("Bad status code: ${response.statusCode}");
        return Left(ServerFaliure(
            errMessage: "Bad status code: ${response.statusCode}"));
      }
    } catch (e) {
      // Handle other errors
      log("Error occurred during login: $e");
      return Left(ServerFaliure(errMessage: e.toString()));
    }
  }

  Future<void> uploadImage() async {
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTE1NDkwMWQ0MjY1ZTlkYTlhNWYzNTQ1YmUyNjU3MDRiMDUwYzMwMDk1ZWM2ZmU3MTNjMTU1NWI1YjllZGU0MzMwZWYxYjdjNTU1NjMwM2QiLCJpYXQiOjE3MTU3ODAxOTUuMjM3MTg3LCJuYmYiOjE3MTU3ODAxOTUuMjM3MTg4LCJleHAiOjE3NDczMTYxOTUuMjM1OTE0LCJzdWIiOiIzNTMiLCJzY29wZXMiOltdfQ.AszNjx7JgKAvvBkTLTwzTOjCyiugB61wk_n3bZ8o-o6S9Grn79Zwki7w_7oqgpqgBq1k7LRtUXo9222b-38WBgyfSvlF6-nZMboPL8YgNNYmrik5HseAEcgzAqe9flpAAyFEP689MkYQnciaf6uPo9xYWRN_SyuqakwvMleDT-VEka4e2ytN2oC216IdcgnkZnmf0MTzD1gDhKPgSeAZYmBtswUnaNp7s6dcXmlSesXyoBEQMzaaZijFUucGCnjZF9WaTNztzv3YIHMY7SQYttcbgTl23GizV6T2xXqHRWWAUSwQMcWyKUgHoBPSgVoeixjI8Aw6M8fZp64JXEeaaf0H-L_P2iJVcJkbMesO0zN1fOXxagXrQ9stKpELW9nsZU2wMQnq61wV_Je63UJ-hzaJ19n83pJTwvr_AUa2ngAUBHjWbp7y7kCT0XZv49A8QDNjlfcE-5ZgymUvKvQtZwHBbv4BRBrpNZsanEGJEBk9SLHwEy1zuNP_4siDw8Q14R2_bC31Fv7viawacP0TT-UFJkRDI0TuDbwnZ7jhm72z-Lox3AZsS84szobQEP5H9s5ukXt_yVXZR8Ig-YgbIf6KzEuLFgxY7YadglxyWLByRBI89ncuL-GqBvm15gQYlEB-mJEHvJNa5uF4lwPQ5jrVwpq-k0dDyf3eXDc38Fg',
    };
    var data = FormData.fromMap({
      'key': 'img',
      'type': 'file',
      'src': '/D:/proMinaAgency/my_gallery/assets/imagesVector.png'
    });

    try {
      var dio = Dio();
      var response = await dio.request(
        'https://flutter.prominaagency.com/api/upload',
        options: Options(
          contentType: "application/json",
          method: 'POST',
          headers: headers,
          followRedirects: true,
          // Add this line
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        log(json.encode(response.data));
      } else {
        log(response.statusMessage!);
      }
    } on DioException catch (e) {
      log(e.message!);
    }
  }

  Future<Either<Faluire, MyGalleryModel>> getImages(
      {required String token}) async {
    var headers = {
      'Authorization': 'Bearer $token',
    };
    try {
      var dio = Dio();
      var response = await dio.request(
        'https://flutter.prominaagency.com/api/my-gallery',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        String data = json.encode(response.data);
        MyGalleryModel myGalleryModel = MyGalleryModel.fromJson(data);
        log(data);
        return Right(myGalleryModel);
      } else {
        log(response.statusMessage!);
        return Left(ServerFaliure(
            errMessage: "Bad status code: ${response.statusCode}"));
      }
    } on DioException catch (e) {
      log(e.message!);
      return Left(ServerFaliure(errMessage: "Bad status code: ${e.message}"));
    }
  }
}
