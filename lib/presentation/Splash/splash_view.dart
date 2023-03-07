import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/Home/Home/Screen/home_view.dart';
import 'package:flutter_application_2/presentation/Tickets/tickets_view.dart';
import 'package:flutter_application_2/presentation/USER/Login/login_view.dart';
import 'package:flutter_application_2/presentation/Wallet/wallet_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => WalletView(),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          Center(
            child: Image.asset(
              "assets/images/Group 19.png",
            ),
          ),
          SizedBox(
            height: 250,
          ),
          Image.asset("assets/images/Group 29.png")
        ],
      ),
    );
  }
}
