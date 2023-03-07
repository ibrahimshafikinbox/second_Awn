import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/component.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TicketsRatingInfoView extends StatefulWidget {
  const TicketsRatingInfoView({super.key});

  @override
  State<TicketsRatingInfoView> createState() => _TicketsRatingInfoViewState();
}

class _TicketsRatingInfoViewState extends State<TicketsRatingInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tickets Info ",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: [
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text("Sunday,22::34 am "),
                      Spacer(),
                      MyDotIcon(Color: Colors.green),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Replied"),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Category Name ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Request Id : 526G ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                      " Loerm Ispum has been the industry standerd dummy text ever science the 1500s , when an unknown printer took a galery of type "),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("reply Text"),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          " Loerm Ispum has been the industry standerd dummy text ever science the 1500s , when an unknown printer took a galery of type ",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "Rating Tickets",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      RatingBar.builder(
                        minRating: 1,
                        allowHalfRating: true,
                        // unratedColor: Colors.white,
                        // glowColor: Colors.amber,
                        itemBuilder: (context, index) => Icon(
                          Icons.star_border,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (value) {
                          print(value);
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GreendefaultButton(function: () {}, text: "Rating")
                    ],
                  ),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color.fromARGB(255, 235, 229, 229),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
