import 'package:flutter/material.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 236, 236),
      appBar: AppBar(
        title: Text(
          "About Us ",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Image.asset("assets/images/Group 19.png"),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "What You Should Know  ? ",
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
                      SizedBox(
                        height: 25,
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
            height: 730,
            width: double.infinity,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
