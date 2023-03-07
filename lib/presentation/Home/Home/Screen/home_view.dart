import 'dart:convert';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/application/Local/constants.dart';
import 'package:flutter_application_2/components/app_local.dart';
import 'package:flutter_application_2/presentation/Home/Home/Cubit/cubit.dart';
import 'package:flutter_application_2/presentation/Home/Home/Cubit/states.dart';
import 'package:flutter_application_2/presentation/Profile/Friends_Invitation/invitation_view.dart';
import 'package:flutter_application_2/presentation/Profile/Get_Notification/get_notification.dart';
import 'package:flutter_application_2/presentation/Profile/Get_Notification/notification_model.dart';

import 'package:flutter_application_2/presentation/Resourses/color_manager.dart';
import 'package:flutter_application_2/application/EndPoints.dart';
import 'package:flutter_application_2/application/dio_helper.dart';
import 'package:flutter_application_2/components/component.dart';
import 'package:flutter_application_2/presentation/USER/Login/cubit/Login_States.dart';
import 'package:flutter_application_2/presentation/USER/Login/models/Login_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

HomeModel? homeModel;
AwnLoginModel? loginModel;
NotificationModel? notificationModel;

String? userData;
String? imageavatr;
String? textbalance;

class HomeModel {
  late HomeDataModel data;
  HomeModel.fromJson(Map<String, dynamic> json) {
    data = HomeDataModel.fromJson(json["data"]);
  }
}

class HomeDataModel {
  String? avatar;
  dynamic? wallet_balance;
  dynamic number_of_children;
  String? referral_id;
  String? email;
  dynamic? salary;
  dynamic? id_number;
  dynamic? date_of_birth;
  dynamic? mobile_number;
  dynamic? referral_count;

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    avatar = json["avatar"];
    wallet_balance = json["wallet_balance"];
    number_of_children = json["number_of_children"];
    referral_id = json["referral_id"];
    salary = json["salary"];
    id_number = json["id_number"];
    date_of_birth = json["date_of_birth"];
    mobile_number = json["mobile_number"];
    referral_count = json["referral_count"];
    email = json["email"];
  }
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FullAppCubit()..getHomeData(),
      child: BlocConsumer<FullAppCubit, FullAppStates>(
        listener: (context, state) {
          if (State is FullAppSuccesState) {
            // DioHelper.getData(url: PROFILE, token: TOKEN).then((value) {
            //   print(value.data);
            //   setState(() {
            //     homeModel = HomeModel.fromJson(value.data);
            //     imageavatr = homeModel!.data.avatar.toString();
            //     textbalance = homeModel!.data.wallet_balance.toString();
            //   });

            //   // print(" its ${homeModel!.data!.toString()}");
            //   print("token is ${homeModel!.data!.email!.toString()}");
            // });
          }
        },
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is! LoginSuccesState,
            // condition: FullAppCubit.get(context).homeModel?.data.avatar != null,
            fallback: (context) => Center(child: CircularProgressIndicator()),
            builder: (context) => Scaffold(
              appBar: AppBar(
                actions: [
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                      onPressed: () {
                        // navigateTo(context, NotificationView());
                        DioHelper.getData(url: PROFILE, token: TOKEN)
                            .then((value) {
                          print(value.data);
                          // print(value.data["avatar"]);
                          homeModel = HomeModel.fromJson(value.data);
                          // imageavatr = homeModel!.data.avatar.toString();
                          textbalance =
                              homeModel!.data.wallet_balance.toString();
                        });
                      },
                      icon: Icon(
                        Icons.notifications_on_outlined,
                      )),
//////////////////////////////////////////////////////////////////////////
                  IconButton(
                      onPressed: () {
                        // navigateTo(context, NotificationView());
                        DioHelper.getData(url: NOTIFICATION, token: TOKEN)
                            .then((value) {
                          print(value.data);
                          notificationModel =
                              NotificationModel.fromJson(value.data);
                          print(notificationModel);
                          navigateTo(context, NotificationView());
                        });
                      },
                      icon: Icon(
                        Icons.local_activity,
                      )),

                  SizedBox(
                    width: 10,
                  ), ///////////////////////////////////////////////////////
                  imageavatr != null
                      ? CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                            homeModel!.data.avatar.toString(),
                          ),
                          backgroundColor: Colors.grey[400])
                      : CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.grey,
                        ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              drawer: BuildDrawer(context),
              body: SafeArea(
                child: ListView(children: [
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              end: Alignment.topLeft,
                              begin: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 47, 134, 12),
                                Color.fromARGB(192, 66, 210, 4),
                              ],
                            ),
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                                textbalance != null
                                    ? Center(
                                        child: Text(
                                          " ${homeModel!.data.wallet_balance.toString()}",
                                          style: const TextStyle(
                                              fontSize: 40,
                                              color: Colors.white),
                                        ),
                                      )
                                    : Text(
                                        "No Data",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate("Your_Balance"),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            height: 120,
                            width: 200,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Image.asset(
                                  "assets/images/loan.png",
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate("Wallet_Cedit"),
                                  style: TextStyle(
                                      color: ColorManager.GreenFormFeild,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            height: 120,
                            width: 200,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Image.asset(
                                  "assets/images/loan.png",
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate("Loan_Request"),
                                  style: TextStyle(
                                      color: ColorManager.GreenFormFeild,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate("Invit_A_Friend"),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.translate(
                                      "you_will_recieve_10% of_the_first_services_fees"),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.5,
                            ),
                            Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate("paid by each friend"),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!
                                          .translate("share_a_link"),
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: BuildCopy_Sahre(),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate("Top 10 In Invitaion"),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Spacer(),
                                TextButton(
                                  onPressed: () {
                                    navigateTo(context, InvitationView());
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .translate("See_All"),
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                BuilderListView(context),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }

  void saveData(String val) async {
    final sharedPref = await SharedPreferences.getInstance();
    imageavatr = sharedPref.getString('imgavatar');
    textbalance = sharedPref.getString('walletBallance');
    getData();
  }

  void getData() async {
    final sharedPref = await SharedPreferences.getInstance();
    setState(() {
      sharedPref.setString(
          'walletBallance', homeModel!.data!.wallet_balance.toString());
      sharedPref.setString('imgavatar', homeModel!.data!.avatar.toString());
    });
  }
}
