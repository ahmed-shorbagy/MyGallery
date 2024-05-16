import 'dart:convert';

import 'data.dart';

class MyGalleryModel {
  String? status;
  Data? data;
  String? message;

  MyGalleryModel({this.status, this.data, this.message});

  @override
  String toString() {
    return 'MyGalleryModel(status: $status, data: $data, message: $message)';
  }

  factory MyGalleryModel.fromMap(Map<String, dynamic> data) {
    return MyGalleryModel(
      status: data['status'] as String?,
      data: data['data'] == null
          ? null
          : Data.fromMap(data['data'] as Map<String, dynamic>),
      message: data['message'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'data': data?.toMap(),
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MyGalleryModel].
  factory MyGalleryModel.fromJson(String data) {
    return MyGalleryModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MyGalleryModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
