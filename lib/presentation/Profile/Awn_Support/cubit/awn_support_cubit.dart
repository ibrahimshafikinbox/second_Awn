import 'package:flutter_application_2/application/EndPoints.dart';
import 'package:flutter_application_2/application/dio_helper.dart';
import 'package:flutter_application_2/presentation/Profile/Awn_Support/Awn_Support_Model/Awn_Support_Model.dart';
import 'package:flutter_application_2/presentation/Profile/Awn_Support/cubit/awn_support_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AwnSupportCubit extends Cubit<AwnSupportStates> {
  AwnSupportCubit() : super(AwnSupportInitialState());
  static AwnSupportCubit get(context) => BlocProvider.of(context);
  // SupportModel? supportModel;
  void Send_Message({String? message, String? image}) {
    emit(AwnSupportLoadingState());
    DioHelper.postData(url: "chat", data: {
      "image": image,
      "message": message,
    }).then((value) {
      print(value.data);
      emit(AwnSupportSuccesState());
    }).catchError((onError) {
      print(onError);
      emit(AwnSupportErrorState(onError));
    });
  }

  void Get_Message() {
    emit(AwnSupportLoadingState());
    DioHelper.getData(
      url: "chat",
      token: TOKEN,
    ).then((value) {
      emit(AwnSupportSuccesState());
      print(value.data);
  
    });
  }
}
