import 'package:flutter/material.dart';
import 'package:flutter_application_2/application/dio_helper.dart';
import 'package:flutter_application_2/presentation/USER/Login/models/regester_model.dart';
import 'package:flutter_application_2/presentation/USER/Regester/cubits/regester_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/EndPoints.dart';

class RegesterCubit extends Cubit<RegesterStates> {
  RegesterCubit() : super(RegesterInitialState());
  static RegesterCubit get(context) => BlocProvider.of(context);

  AwnRegesterModel? RegesterModel;
  void UserRegester({
    required String id_number,
    required String password,
    required String date_of_birth,
    required String mobile_number,
    required String password_confirmation,
    required String default_language,
  }) {
    emit(RegesterLoadingState());
    DioHelper.postData(
      url: REGESTER,
      data: {
        "id_number": id_number,
        "password": password,
        "mobile_number": mobile_number,
        "date_of_birth": date_of_birth,
        "default_language": "ar",
        "password_confirmation": password_confirmation,
      },
    ).then((value) {
      RegesterModel = AwnRegesterModel.fromJson(value.data);
      print(RegesterModel!.message);
      emit(RegesterSuccesState());
    }).catchError((error) {
      print(RegesterModel!.errors);
      emit(RegesterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }
}
