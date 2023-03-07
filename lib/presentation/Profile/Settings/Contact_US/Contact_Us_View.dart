import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_2/components/app_local.dart';
import 'package:flutter_application_2/components/component.dart';
import 'package:flutter_application_2/presentation/Profile/Awn_Support/awn_support_view.dart';
import 'package:flutter_application_2/presentation/Profile/Settings/Contact_US/Cubit/Contact_Cubit.dart';
import 'package:flutter_application_2/presentation/Profile/Settings/Contact_US/Cubit/Contact_States.dart';
import 'package:flutter_application_2/presentation/USER/Login/cubit/Login_States.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  var Full_Name_Controller = TextEditingController();
  var Subject_Controller = TextEditingController();
  var Email_Controller = TextEditingController();
  var Message_Controller = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ContactCubit(),
      child: BlocConsumer<ContactCubit, ContactStates>(
        listener: (BuildContext context, state) {
          if (State is ContactSuccessState) {
            showToast(text: "text", state: ToastStates.SUCCESS);
          }
        },
        builder: (BuildContext, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Contact Us",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              centerTitle: true,
            ),
            body: Form(
              key: formKey,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Contact Request",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "We Here to help you in your compaint",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Full Name "),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultPersonalData(
                          controller: Full_Name_Controller,

                          label: ' ',

                          // 'Id Number ',
                          onValidate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "The ID number field must not be empty";
                            }
                            return null;
                          },
                          type: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Email "),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultPersonalData(
                          controller: Email_Controller,
                          label: ' ',
                          onValidate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "The ID number field must not be empty";
                            }
                            return null;
                          },
                          type: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Subject "),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultPersonalData(
                          controller: Subject_Controller,
                          label: "  ",
                          onValidate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "The ID number field must not be empty";
                            }
                            return null;
                          },
                          type: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(" Your Message "),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultPersonalData(
                          controller: Message_Controller,
                          label: "",
                          onValidate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "The ID number field must not be empty";
                            }
                            return null;
                          },
                          type: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        // ConditionalBuilder(
                        //   condition: state is! ContactLoadingState,
                        //   builder: (context) {
                        //     return GreendefaultButton(
                        //       text: 'login',
                        //       function: () {
                        //         if (formKey.currentState!.validate()) {
                        //           ContactCubit.get(context).ContactUs(
                        //             name: Full_Name_Controller.text,
                        //             email: Email_Controller.text,
                        //             subject: Subject_Controller.text,
                        //             message: message_Controller.text,
                        //           );
                        //         }
                        //       },
                        //       isUpperCase: true,
                        //     );
                        //   },
                        //   fallback: (context) => Center(
                        //     child: CircularProgressIndicator(),
                        //   ),
                        // ),
                        ConditionalBuilder(
                          condition: state is! ContactLoadingState,
                          builder: (context) => GreendefaultButton(
                            text: 'SUBMIT',
                            radius: 20,
                            function: () {
                              if (formKey.currentState!.validate()) {
                                ContactCubit.get(context).ContactUs(
                                  email: Email_Controller.text,
                                  message: Message_Controller.text,
                                  subject: Subject_Controller.text,
                                  name: Full_Name_Controller.text,
                                );
                              }
                            },
                            isUpperCase: true,
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
