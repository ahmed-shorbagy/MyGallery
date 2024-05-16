import 'dart:convert';

class Data {
  List<dynamic>? images;

  Data({this.images});

  @override
  String toString() => 'Data(images: $images)';

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        images: data['images'] as List<dynamic>?,
      );

  Map<String, dynamic> toMap() => {
        'images': images,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());
}
