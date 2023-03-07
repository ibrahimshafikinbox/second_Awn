import 'package:flutter/material.dart';
import 'package:flutter_application_2/application/Local/constants.dart';
import 'package:flutter_application_2/application/loca_network.dart';
import 'package:flutter_application_2/presentation/USER/Login/cubit/Login_States.dart';
import 'package:flutter_application_2/application/EndPoints.dart';
import 'package:flutter_application_2/application/dio_helper.dart';
import 'package:flutter_application_2/presentation/USER/Login/models/Login_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  AwnLoginModel? loginModel;
  void userLogin({
    required String id_number,
    required String password,
    required String type,
    required String device_token,
    // required String device_token,
    // required String type,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        "id_number": id_number,
        "password": password,
        "device_token": "device_token",
        "type": "type",
      },
    ).then((value) async {
      print(value.data);
      loginModel = value.data;
      // await CachNetwork.InsretToCache(Key: "Token", Value: loginModel!.token);

      emit(LoginSuccesState());
    }).catchError((error) {
      print(error);
      emit(LoginErrorState(error.toString()));
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
























  // void UserLogin({
  //   required String password,
  //   required String id_number,
  // }) {
  //   emit(LoginLoadingState());
  //   DioHelper.postData(
  //     url: LOGIN,
  //     data: {
  //       "id_number": id_number,
  //       "password": password,
  //     },
  //   ).then((value) {
  //     print(value.data);
  //     LOGINMODEL = AwnLoginModel.fromJson(value.data);
  //     print(LOGINMODEL!.message);
  //     emit(LogigSuccesState());
  //   }).catchError((error) {
  //     emit(LoginErrorState(error.toString()));
  //   });