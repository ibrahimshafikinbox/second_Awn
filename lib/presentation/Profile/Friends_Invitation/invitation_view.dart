import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/component.dart';

class InvitationView extends StatelessWidget {
  const InvitationView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Friends Invitation ",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: SingleChildScrollView(),
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  text: "Freinds Invitaion",
                ),
                Tab(
                  text: "Send Invitaion",
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Column(
                    children: [
                      BuilderInvitation(context),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 350,
                        child: Image.asset("assets/images/222222222.png"),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "  Invit a friend ",
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
                                "   you will recieve 10% of the first services fees ",
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
                                "   paid by each friend",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
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
                                    "    share a link ",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: BuildCopy_Sahre(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


















/**  return Scaffold(
      appBar: AppBar(
        title: Text(
          "Friends Inviatation",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          BuilderInvitation(context),
        ],
      ),
    );*/