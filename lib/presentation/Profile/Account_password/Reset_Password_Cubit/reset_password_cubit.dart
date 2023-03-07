import 'package:flutter_application_2/application/EndPoints.dart';
import 'package:flutter_application_2/application/dio_helper.dart';
import 'package:flutter_application_2/components/component.dart';
import 'package:flutter_application_2/presentation/Home/Home/Cubit/states.dart';
import 'package:flutter_application_2/presentation/Profile/Account_password/Reset_Password_Cubit/reset_password_states.dart';
import 'package:flutter_application_2/presentation/Profile/Account_password/pasword_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  ResetPasswordCubit() : super(ResetPasswordInitialState());
  static ResetPasswordCubit get(context) => BlocProvider.of(context);
  ResetPasswordModel? passwordModel;
  void ResetPassword({
    required String id_number,
    required String password,
    required String password_confirmation,
  }) {
    emit(ResetPasswordLoadingState());
    DioHelper.postData(url: RESET_PASSWORD, data: {
      "id_number": id_number,
      "password": password,
      "password_confirmation": password_confirmation,
    }).then((value) {
      print(value.data);
      // passwordModel = ResetPasswordModel.fromJson(value.data);
      // print(passwordModel!.message);
      emit(ResetPasswordSuccessState());
      showToast(text: "Succes ", state: ToastStates.SUCCESS);
    }).catchError((error) {
      print(error);
      showToast(
          text: "Error ,Please cheak Your Id , And Cheak Password  ",
          state: ToastStates.ERROR);

      // print(passwordModel?.message);
      emit(ResetPasswordErrorState(error.toString()));
    });
  }
}
