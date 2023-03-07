import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/app_local.dart';
import 'package:flutter_application_2/presentation/Profile/Awn_Support/awn_support_view.dart';
import 'package:flutter_application_2/presentation/Profile/Friends_Invitation/invitation_view.dart';
import 'package:flutter_application_2/presentation/Home/Home/Screen/home_view.dart';
import 'package:flutter_application_2/presentation/Loan_Request_Log/loan_request_view.dart';
import 'package:flutter_application_2/presentation/Profile/profile_view.dart';
import 'package:flutter_application_2/presentation/Resourses/color_manager.dart';
import 'package:flutter_application_2/presentation/Profile/Settings/settings_view.dart';
import 'package:flutter_application_2/presentation/Tickets/aa_tickets_view.dart';
import 'package:flutter_application_2/presentation/Tickets/tickets_info_view.dart';
import 'package:flutter_application_2/presentation/Tickets/tickets_view.dart';
import 'package:flutter_application_2/presentation/Wallet/wallet_view.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/Profile/Personal/personal_information_view.dart';

var ClipBoardController = TextEditingController();
var ShareController = TextEditingController();

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  ValueChanged<String>? onChanged,
  VoidCallback? onTap,
  required FormFieldValidator<String>? onValidate,
  VoidCallback? suffixPressed,
  required String label,
  required String hint,
  required IconData prefix,
  bool isPassword = false,
  IconData? suffix,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: (s) {
        onSubmit;
      },
      onChanged: onChanged,
      onTap: onTap,
      validator: onValidate,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Color.fromARGB(255, 165, 159, 159),
      ),
    );

List ListBilder = [
  {
    "number": "1",
    "name": "Ather Gossten",
    "Number of invataion": "13",
  },
  {
    "number": "2",
    "name": "Ather Gossten",
    "Number of invataion": "14",
  },
  {
    "number": "3",
    "name": "Ather Gossten",
    "Number of invataion": "15",
  },
];

Widget BuilderListView(BuildContext context) {
  return Expanded(
    child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: 3,
        itemBuilder: (context, i) {
          return Card(
            elevation: 15,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(20)),
                ),
                margin: EdgeInsets.all(15),
                height: 70,
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Center(
                        child: Text(
                          "${ListBilder[i]["number"]}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.green[400],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [Text('${ListBilder[i]["name"]}')],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                                "Number of invitation  :  ${ListBilder[i]["Number of invataion"]}")
                          ],
                        )
                      ],
                    ),
                  ],
                )),
          );
        }),
  );
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget GreendefaultButton({
  double height = 50,
  width = double.infinity,
  // Color background = ColorManager.GreenFormFeild,
  required VoidCallback function,
  required String text,
  bool isUpperCase = true,
  double radius = 20.0,
  Color textColor = Colors.white,
}) =>
    Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.topLeft,
          begin: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 47, 134, 12),
            Color.fromARGB(192, 66, 210, 4),
          ],
        ),
        borderRadius: BorderRadius.circular(radius),
        color: ColorManager.GreenFormFeild,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: textColor,
          ),
        ),
      ),
    );
Widget Builder_Chat_For_Me(BuildContext context) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      padding: EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        color: ColorManager.GreenFormFeild,
      ),
      child: Text(
        "message,",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}

Widget Builder_Chat_For_Starnger(BuildContext context) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      padding: EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        color: ColorManager.TextPrimary,
      ),
      child: Text(
        "   message.message,",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}

Widget textFieldOTP({bool? first, last}) {
  return Container(
    height: 85,
    child: AspectRatio(
      aspectRatio: 1.0,
      child: TextField(
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {}
          if (value.length == 0 && first == false) {}
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counter: Offstage(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black12),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.lightGreen),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),
  );
}

Widget defaultButton({
  double height = 50,
  double width = double.infinity,
  // Color background = ColorManager.GreenFormFeild,
  required VoidCallback function,
  required String text,
  bool isUpperCase = true,
  double radius = 10.0,
  Color textColor = Colors.black,
}) =>
    Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: ColorManager.WFormfeild,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: textColor,
          ),
        ),
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => widget,
      ),
      (route) => false,
    );

Widget BuildCopy_Sahre() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[400],
        ),
        child: Row(
          children: [
            Text("   hwyrlc4cuj512c45v42cx15dc15"),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.black,
                size: 20,
              ),
              onPressed: () async {
                await Share.share("https://www.facebook.com/me/");
              },
            ),
            IconButton(
              icon: Icon(
                Icons.copy,
                color: Colors.black,
                size: 20,
              ),
              onPressed: () async {
                await FlutterClipboard.copy("https://www.facebook.com/me/")
                    .then((value) {
                  showToast(
                      text: "  coppid to clipboard ",
                      state: ToastStates.SUCCESS);
                });
              },
            ),
          ],
        ),
      ),
    );

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.yellow;
      break;
  }
  return color;
}

Widget BuilderInvitation(BuildContext context) {
  return Expanded(
    child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: 10,
        itemBuilder: (context, i) {
          return Card(
            elevation: 15,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(20)),
                ),
                margin: EdgeInsets.all(15),
                height: 70,
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Center(
                        child: Text(
                          "${ListBilder[0]["number"]}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.green[400],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [Text('${ListBilder[0]["name"]}')],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                                "Number of invitation  :  ${ListBilder[0]["Number of invataion"]}")
                          ],
                        )
                      ],
                    ),
                  ],
                )),
          );
        }),
  );
}

Widget BuildDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          MyHeaderDrawer(context),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  navigateTo(context, HomeView());
                },
                child: Text(
                  AppLocalizations.of(context)!.translate("Home"),
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_right,
                  size: 30,
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  navigateTo(context, ProfileView());
                },
                child: Text(
                  AppLocalizations.of(context)!.translate("Profile"),
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  navigateTo(context, ProfileView());
                },
                icon: Icon(
                  Icons.arrow_right,
                  size: 30,
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  navigateTo(context, WalletView());
                },
                child: Text(
                  AppLocalizations.of(context)!.translate("Wallet"),
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_right,
                  size: 30,
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  navigateTo(context, TicketsView());
                },
                child: Text(
                  AppLocalizations.of(context)!.translate("Tickets"),
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_right,
                  size: 30,
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  navigateTo(context, AwnSupportView());
                },
                child: Text(
                  AppLocalizations.of(context)!.translate("Awn_Support"),
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_right,
                  size: 30,
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  navigateTo(context, LoanView());
                },
                child: Text(
                  AppLocalizations.of(context)!.translate("Loan_Request_Log"),
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_right,
                  size: 30,
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  navigateTo(context, InvitationView());
                },
                child: Text(
                  AppLocalizations.of(context)!.translate("Friends_Invitaion"),
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_right,
                  size: 30,
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  navigateTo(context, SettingsView());
                },
                child: Text(
                  AppLocalizations.of(context)!.translate("Settings"),
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_right,
                  size: 30,
                ),
              ),
            ],
          ),
          //*********************************************** *
        ],
      ),
    ),
  );
}

MyDrawerListItem({
  required text,
}) async {
  return Row(
    children: [
      TextButton(
        onPressed: () {},
        child: Text(
          "${text}",
          style: TextStyle(fontSize: 22),
        ),
      ),
      Spacer(),
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_right,
            size: 30,
          ))
    ],
  );
}

Widget MyHeaderDrawer(BuildContext context) {
  return Container(
    child: Column(
      children: [
        Row(
          children: [
            Container(
              height: 150,
              color: Colors.white,
              child: Row(
                children: [
                  if (imageavatr != null)
                    CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                          imageavatr!,
                        ),
                        backgroundColor: Colors.grey[400]),
////////////////////////////////////////////////////////////////////////////////////////
                  // CircleAvatar(
                  //   radius: 30,
                  //   backgroundImage: NetworkImage(
                  //     imageavatr!,
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              width: 25,
            ),
            Text(
              AppLocalizations.of(context)!.translate("Menu"),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ],
    ),
  );
}

Widget NotificationBuilder(BuildContext context) {
  return Expanded(
    child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: 10,
        itemBuilder: (context, i) {
          return Card(
            elevation: 15,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(20)),
                ),
                margin: EdgeInsets.all(15),
                height: 70,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                                "Notification From  ${ListBilder[0]["name"]}  sent")
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("     2:23 pm "),
                      ],
                    )
                  ],
                )),
          );
        }),
  );
}

Widget defaultPersonalData({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  ValueChanged<String>? onChanged,
  VoidCallback? onTap,
  required FormFieldValidator<String>? onValidate,
  VoidCallback? suffixPressed,
  required String label,
  // required String hint,
  // required IconData prefix,
  bool isPassword = false,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: (s) {
        onSubmit;
      },
      onChanged: onChanged,
      onTap: onTap,
      validator: onValidate,
      decoration: InputDecoration(
        // hintText: hint,
        // labelText: label,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );

Widget BuildData({required label, required data}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Text(
            "   $label",
            style: TextStyle(color: Colors.black54, fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "   $data",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    ),
  );
}

Widget BuildStatusOfTickets(
    {required Status, required category, required details}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.red),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "$Status",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          myDivider(),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/Icon awesome-ti.png",
                ),
              ),
              Text(
                "$category",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
          Text(
            "      $details",
            style: TextStyle(color: Colors.black, fontSize: 15),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(10),
        color: Colors.white,
      ),
      height: 130,
      width: double.infinity,
    ),
  );
}

Widget BuildRepliedOfTickets(
    {required Status, required category, required details}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "$Status",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          myDivider(),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/Icon awesome-ti.png",
                ),
              ),
              Text(
                "$category",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
          Text(
            "      $details",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              children: [
                Text("Rating Tickets"),
                Icon(
                  Icons.navigate_next_sharp,
                ),
                Spacer(),
                RatingBarIndicator(
                  // rating: 3,
                  itemSize: 30.0,
                  itemBuilder: (context, index) {
                    return const Icon(
                      Icons.star_outline_rounded,
                      color: Colors.amber,
                    );
                  },
                ),
              ],
            ),
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 235, 231, 231)),
            height: 47,
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(10),
        color: Colors.white,
      ),
      height: 160,
      width: double.infinity,
    ),
  );
}

Widget Build_Replied_Of_Tickets_With_Add(
    {required Status, required category, required details}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "$Status",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          myDivider(),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/Icon awesome-ti.png",
                ),
              ),
              Text(
                "$category",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "      $details",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              Spacer(),
              FloatingActionButton(
                onPressed: () {
                  navigateTo(context, AddTicketsView());
                },
                child: Icon(
                  Icons.add,
                  size: 35,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              children: [
                Text("Rating Tickets"),
                Icon(
                  Icons.navigate_next_sharp,
                ),
                Spacer(),
                RatingBarIndicator(
                  rating: 3,
                  itemSize: 40.0,
                  itemBuilder: (context, index) {
                    return IconButton(
                      icon: Icon(
                        Icons.star,
                      ),
                      color: Colors.amber,
                      onPressed: () {
                        navigateTo(context, TicketsRatingInfoView());
                      },
                    );
                  },
                ),
              ],
            ),
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 235, 231, 231)),
            height: 47,
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(10),
        color: Colors.white,
      ),
      height: 200,
      width: double.infinity,
    ),
  );
}

Widget MyDotIcon({required dynamic Color}) {
  return Container(
    height: 10,
    width: 10,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color),
  );
}
