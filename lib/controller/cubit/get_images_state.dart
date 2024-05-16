part of 'get_images_cubit.dart';

@immutable
sealed class GetImagesState {}

final class GetImagesInitial extends GetImagesState {}

final class GetImagesLoading extends GetImagesState {}

final class GetImagesSuccess extends GetImagesState {
  final List<dynamic> imagesUrl;

  GetImagesSuccess({required this.imagesUrl});
}

final class GetImagesFaluire extends GetImagesState {
  final String erreMssage;

  GetImagesFaluire({required this.erreMssage});
}
