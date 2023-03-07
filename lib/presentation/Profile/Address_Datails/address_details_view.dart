import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/component.dart';

class AdrressDeatailsView extends StatefulWidget {
  const AdrressDeatailsView({super.key});

  @override
  State<AdrressDeatailsView> createState() => _AdrressDeatailsViewState();
}

class _AdrressDeatailsViewState extends State<AdrressDeatailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            " Address Details ",
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w400),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Can't Edit National Address Details Any Time",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      BuildData(label: "Building Number", data: "15"),
                      BuildData(label: "Streat Name", data: "  str 18 Malek"),
                      BuildData(label: "Neighboarhood", data: "Alnassam"),
                      BuildData(label: "City", data: "Damam"),
                      BuildData(label: "postal Code", data: "1111111"),
                      BuildData(
                          label: "Additional Number", data: "01235565565"),
                      BuildData(label: "Unit Number", data: "0309315881"),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
