import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/app_local.dart';
import 'package:flutter_application_2/components/component.dart';
import 'package:flutter_application_2/presentation/Profile/Account_password/Reset_Password_Cubit/reset_password_cubit.dart';
import 'package:flutter_application_2/presentation/Profile/Account_password/Reset_Password_Cubit/reset_password_states.dart';
import 'package:flutter_application_2/presentation/Profile/Account_password/pasword_model.dart';
import 'package:flutter_application_2/presentation/Profile/Account_password/pasword_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPasswordview extends StatefulWidget {
  const AccountPasswordview({super.key});

  @override
  State<AccountPasswordview> createState() => _AccountPasswordviewState();
}

class _AccountPasswordviewState extends State<AccountPasswordview> {
  @override
  var Id_Number_Controller = TextEditingController();
  var New_Password_Controller = TextEditingController();
  var Confirm_New_Password_Controller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  ResetPasswordModel? passwordModel;

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ResetPasswordCubit(),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
        listener: (context, state) {},
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                // " Password ",
                AppLocalizations.of(context)!.translate("Pass_word"),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w400),
              ),
              centerTitle: true,
            ),
            body: Form(
              key: formKey,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              // "You can change your account password",
                              AppLocalizations.of(context)!
                                  .translate("You_can_change_password"),

                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("ID Number "),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultPersonalData(
                          controller: Id_Number_Controller,
                          // label: AppLocalizations.of(context)!
                          //     .translate("Id_Number"),

                          label: AppLocalizations.of(context)!
                              .translate("Id_Number"),
                          // 'Id Number ',
                          onValidate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!.translate(
                                  "The ID number field must not be empty");
                            }
                            return null;
                          },
                          type: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("New Password"
                                // AppLocalizations.of(context)!
                                //     .translate("New_Password"),
                                ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultPersonalData(
                          controller: New_Password_Controller,

                          label: "",
                          //  'Confirm_New_Password',
                          onValidate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!.translate(
                                  "The Password field must not be empty");
                            }
                            return null;
                          },
                          type: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("New Password Confirm"
                                // AppLocalizations.of(context)!
                                //     .translate("New_Password"),
                                ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultPersonalData(
                          controller: Confirm_New_Password_Controller,
                          label: AppLocalizations.of(context)!
                              .translate("Confirm_New_Password"),
                          onValidate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!.translate(
                                  "The Password field must not be empty");
                            }
                            return null;
                          },
                          type: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        // ConditionalBuilder(
                        //   builder: (context) => GreendefaultButton(
                        //     function: () {
                        //       if (formKey.currentState!.validate()) {
                        //         ResetPasswordCubit.get(context).ResetPassword(
                        //           id_number: Id_Number_Controller.text,
                        //           password: New_Password_Controller.text,
                        //           password_confirmation:
                        //               Confirm_New_Password_Controller.text,
                        //         );
                        //       }
                        //     },
                        //     text: AppLocalizations.of(context)!
                        //         .translate("Confirm"),
                        //   ),
                        //   condition: state is! ResetPasswordLoadingState,
                        //   fallback: (context) =>
                        //       Center(child: CircularProgressIndicator()),
                        // ),
                        ConditionalBuilder(
                          condition: state is! ResetPasswordLoadingState,
                          builder: (context) => GreendefaultButton(
                            text: "CONFRIM",
                            function: () {
                              if (formKey.currentState!.validate()) {
                                ResetPasswordCubit.get(context).ResetPassword(
                                  id_number: Id_Number_Controller.text,
                                  password: New_Password_Controller.text,
                                  password_confirmation:
                                      Confirm_New_Password_Controller.text,
                                );
                              }
                            },
                          ),
                          fallback: (context) => Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
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
