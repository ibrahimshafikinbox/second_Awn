import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/application/Local/shared_pref.dart';
import 'package:flutter_application_2/presentation/Home/Home/Cubit/states.dart';
import 'package:flutter_application_2/presentation/Home/Home/Screen/home_view.dart';
import 'package:flutter_application_2/application/EndPoints.dart';
import 'package:flutter_application_2/application/dio_helper.dart';
import 'package:flutter_application_2/presentation/Profile/Get_Notification/notification_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FullAppCubit extends Cubit<FullAppStates> {
  FullAppCubit() : super(FullAppInitialState());
  static FullAppCubit get(context) => BlocProvider.of(context);
  HomeModel? homeModel;
  NotificationModel? notificationModel;
  String? textbalance;
  // HomeDataModel? datamodel;
  void getHomeData() {
    DioHelper.getData(url: PROFILE, token: TOKEN).then((value) {
      print(value.data);

      homeModel = HomeModel.fromJson(value.data);
      imageavatr = homeModel!.data.avatar.toString();
      textbalance = homeModel!.data.wallet_balance;

      print(" its ${homeModel!.data!.toString()}");
      print("token is ${homeModel!.data!.email!.toString()}");
    });
  }

  void getNotification() {
    DioHelper.getData(url: NOTIFICATION, token: TOKEN).then(
      (value) {
        print(value.data["meta"]);
      },
    );
  }
}
