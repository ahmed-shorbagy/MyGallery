import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../utils/Api_service.dart';

part 'get_images_state.dart';

class GetImagesCubit extends Cubit<GetImagesState> {
  GetImagesCubit() : super(GetImagesInitial());
  Future<void> getImages({required String token}) async {
    emit(GetImagesLoading());
    var result = await ApiService().getImages(token: token);
    result.fold(
        (faluire) => emit(GetImagesFaluire(erreMssage: faluire.errMessage)),
        (success) =>
            emit(GetImagesSuccess(imagesUrl: success.data?.images ?? [])));
  }
}
