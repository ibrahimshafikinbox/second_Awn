import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/component.dart';

class OtpView extends StatefulWidget {
  // const Otp({Keynkey}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<OtpView> {
  mainAxisAlignment() => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '5-  Guest one Step  ',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '  Verfication  ',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "  Enter your OTP code number",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              child: Image.asset(
                'assets/images/Mailbox.png',
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Container(
              padding: EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textFieldOTP(first: true, last: false),
                      textFieldOTP(first: false, last: false),
                      textFieldOTP(first: false, last: false),
                      textFieldOTP(first: false, last: true),
                    ],
                  ),
                ],
              ),
            ),
            GreendefaultButton(function: () {}, text: "Confirm"),
            SizedBox(
              height: 18,
            ),
            defaultButton(function: () {}, text: "send For Email"),
            SizedBox(
              height: 15,
            ),
            Text(
              "Resend New Code in: 30 sec",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
