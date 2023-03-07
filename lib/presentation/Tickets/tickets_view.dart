import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/component.dart';

class TicketsView extends StatefulWidget {
  const TicketsView({super.key});

  @override
  State<TicketsView> createState() => _TicketsViewState();
}

class _TicketsViewState extends State<TicketsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 227, 223, 223),
        appBar: AppBar(
          title: Text(
            "Tickets",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                BuildStatusOfTickets(
                    Status: "Status of tickets",
                    category: "Category",
                    details: "Tickets details be written here"),
                BuildStatusOfTickets(
                    Status: "Status of tickets",
                    category: "Category",
                    details: "Tickets details be written here"),
                BuildStatusOfTickets(
                    Status: "Status of tickets",
                    category: "Category",
                    details: "Tickets details be written here"),
                BuildRepliedOfTickets(
                    Status: "Replied",
                    category: "Category",
                    details: "Tickets details be written here"),
                Build_Replied_Of_Tickets_With_Add(
                    Status: "Replied",
                    category: "Category",
                    details: "Tickets details be written here"),
              ],
            ),
          ],
        ));
  }
}
