import 'package:flutter/material.dart';
import 'package:flutter_application_2/application/EndPoints.dart';
import 'package:flutter_application_2/application/dio_helper.dart';
import 'package:flutter_application_2/components/component.dart';
import 'package:flutter_application_2/presentation/Profile/Awn_Support/Awn_Support_Model/Awn_Support_Model.dart';
import 'package:flutter_application_2/presentation/Profile/Awn_Support/cubit/awn_support_cubit.dart';
import 'package:flutter_application_2/presentation/Profile/Awn_Support/cubit/awn_support_state.dart';

class AwnSupportView extends StatefulWidget {
  const AwnSupportView({super.key});

  @override
  State<AwnSupportView> createState() => _AwnSupportViewState();
}

// late SupportModel supportModel;
var message_Controller = TextEditingController();
var image_Controller = TextEditingController();
var formKey = GlobalKey<FormState>();

class _AwnSupportViewState extends State<AwnSupportView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " Password ",
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.w400),
        ),
        leading: FloatingActionButton(
          onPressed: () {
            DioHelper.getData(
              url: "chat",
              token: TOKEN,
            ).then((value) {
              print(value.data);
              supportModel = value.data;
              // print(supportModel);
              // supportModel = value.data;
              print(" suport model is ${supportModel}");
            });
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Image.asset("assets/images/Photo.png"),
                SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    Text(
                      "You And Awn ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    Text("Last activate 10:02 pm")
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          myDivider(),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Builder_Chat_For_Me(context);
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "   type message",
                suffixIcon: IconButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        AwnSupportCubit.get(context).Send_Message(
                          image: image_Controller.text,
                          message: message_Controller.text,
                        );
                      }
                    },
                    icon: Icon(Icons.send)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
