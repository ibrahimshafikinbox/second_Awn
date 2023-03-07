import 'package:flutter/material.dart';

class Terms_ConditionView extends StatefulWidget {
  const Terms_ConditionView({super.key});

  @override
  State<Terms_ConditionView> createState() => _Terms_ConditionViewState();
}

class _Terms_ConditionViewState extends State<Terms_ConditionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 236, 236),
      appBar: AppBar(
        title: Text(
          "Terms And Conditions",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Terms And Conditions",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "1 - Section Title ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                            " Loerm Ispum has been the industry standerd dummy text ever science the 1500s , when an unknown printer took a galery of type "),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "2 - Section Title ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                            " Loerm Ispum has been the industry standerd dummy text ever science the 1500s , when an unknown printer took a galery of type "),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "3 - Section Title ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                            " Loerm Ispum has been the industry standerd dummy text ever science the 1500s , "),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "4 - Section Title ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                            " Loerm Ispum has been the industry standerd dummy text ever science the 1500s , when an unknown printer took a galery of type, Loerm Ispum has been the industry standerd dummy text ever science the 1500s  Loerm Ispum has been the industry standerd dummy text ever science the 1500s  "),
                      ),
                    ],
                  )
                ],
              ),
            ),
            height: 700,
            width: double.infinity,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
