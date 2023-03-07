import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/application/EndPoints.dart';
import 'package:flutter_application_2/components/app_local.dart';
import 'package:flutter_application_2/components/component.dart';
import 'package:flutter_application_2/presentation/Home/Home/Screen/home_view.dart';
import 'package:flutter_application_2/presentation/Profile/Account_password/account_password_view.dart';
import 'package:flutter_application_2/presentation/Profile/Address_Datails/address_details_view.dart';
import 'package:flutter_application_2/presentation/Profile/Personal/personal_information_view.dart';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.translate("Profile"),
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            ClipOval(
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                backgroundImage: NetworkImage(
                                    homeModel!.data.avatar.toString()),
                                radius: 32,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  " ${homeModel!.data!.email!.toString()} ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "User Id  : ${homeModel!.data!.referral_id.toString()}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    height: 110,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        end: Alignment.topLeft,
                        begin: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 143, 216, 114),
                          Color.fromARGB(192, 66, 210, 4),
                        ],
                      ),
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          navigateTo(context, personalInformationView());
                        },
                        child: Text(
                          AppLocalizations.of(context)!
                              .translate("Personal_Information"),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ))
                  ],
                ),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          navigateTo(context, AccountPasswordview());
                        },
                        child: Text(
                          AppLocalizations.of(context)!
                              .translate("Account_Password"),

                          // "Account_Password ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ))
                  ],
                ),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          navigateTo(context, AdrressDeatailsView());
                        },
                        child: Text(
                          // "Address_Details ",
                          AppLocalizations.of(context)!
                              .translate("Address_Details"),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ))
                  ],
                ),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context)!.translate("Eligi_Info"),
                          // "Eligibility Information ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ))
                  ],
                ),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context)!
                              .translate("Banks_Account"),
                          // "Banck_Account ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ))
                  ],
                ),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context)!.translate("Logout"),
                          // "LogOut ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w200),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
