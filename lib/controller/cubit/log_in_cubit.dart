import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_gallery/utils/Api_service.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());
  Future<void> logInUser(
      {required String email, required String password}) async {
    emit(LogInLoading());
    var responce =
        await ApiService().loginUser(email: email, password: password);
    responce.fold((left) {
      emit(LogInFailure(errMessage: left.errMessage));
    }, (r) {
      emit(LogInSucces());
    });
  }
}
