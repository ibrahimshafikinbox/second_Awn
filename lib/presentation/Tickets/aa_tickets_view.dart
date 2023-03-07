import 'package:flutter/material.dart';

class AddTicketsView extends StatefulWidget {
  const AddTicketsView({super.key});

  @override
  State<AddTicketsView> createState() => _AddTicketsViewState();
}

class _AddTicketsViewState extends State<AddTicketsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tickets",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
    );
  }
}
