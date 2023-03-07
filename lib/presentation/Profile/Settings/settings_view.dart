import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/component.dart';
import 'package:flutter_application_2/presentation/Profile/Settings/About_Us/About_US_View.dart';
import 'package:flutter_application_2/presentation/Profile/Settings/Contact_US/Contact_Us_View.dart';
import 'package:flutter_application_2/presentation/Profile/Settings/Privacy_Policy/privacy_policy_View.dart';
import 'package:flutter_application_2/presentation/Profile/Settings/Terms_and_condition/Terms_And_Conditions_View.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 233, 233),
      appBar: AppBar(
        title: Text(
          "settings",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            child: Column(children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "privacy policy",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          navigateTo(context, PrivacyView());
                        },
                        icon: Icon(Icons.arrow_forward))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Terms And condition",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          navigateTo(context, Terms_ConditionView());
                        },
                        icon: Icon(Icons.arrow_forward))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "About US",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          navigateTo(context, AboutUsView());
                        },
                        icon: Icon(Icons.arrow_forward))
                  ],
                ),
              )
            ]),
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Contact Us",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            navigateTo(context, ContactUsView());
                          },
                          icon: Icon(Icons.arrow_forward))
                    ],
                  ),
                ),
              ]),
            ),
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
          ),
        ],
      ),
    );
  }
}
