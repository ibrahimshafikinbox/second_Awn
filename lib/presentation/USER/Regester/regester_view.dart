import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/component.dart';
import 'package:flutter_application_2/presentation/Home/Home/Screen/home_view.dart';
import 'package:flutter_application_2/presentation/USER/Regester/cubits/regester_cubit.dart';
import 'package:flutter_application_2/presentation/USER/Regester/cubits/regester_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegesterView extends StatefulWidget {
  const RegesterView({super.key});

  @override
  State<RegesterView> createState() => _RegesterViewState();
}

class _RegesterViewState extends State<RegesterView> {
  var Id_NumberController = TextEditingController();

  var Mobile_NumberController = TextEditingController();
  var PasswordController = TextEditingController();
  var ConfirmPasswordController = TextEditingController();
  var Date_of_birthController = TextEditingController();
  var default_languageController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegesterCubit(),
      child: BlocConsumer<RegesterCubit, RegesterStates>(
        listener: (context, state) {
          if (state is RegesterSuccesState) {
            showToast(
                text: state.regesterModel!.message!,
                state: ToastStates.SUCCESS);
            navigateAndFinish(
              context,
              HomeView(),
            );
          } else {
            showToast(
                text: "check data you entered ", state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: formKey,
              child: ListView(
                children: [
                  Container(
                    height: 150,
                    child: Center(
                      child: Image.asset(
                        "assets/images/Group 19.png",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        "Register New Account",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultFormField(
                      controller: Id_NumberController,
                      type: TextInputType.visiblePassword,
                      label: "ID Number",
                      hint: '55555',
                      prefix: Icons.person,
                      onValidate: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your phone';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultFormField(
                      controller: Mobile_NumberController,
                      type: TextInputType.visiblePassword,
                      label: "Mobile Number",
                      hint: '01001683950',
                      prefix: Icons.phone,
                      onValidate: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your Mobile number';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultFormField(
                      controller: Date_of_birthController,
                      type: TextInputType.visiblePassword,
                      label: "Date of birth",
                      hint: '00 / 00 / 00',
                      prefix: Icons.date_range,
                      onValidate: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your bitrh date';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultFormField(
                      controller: default_languageController,
                      type: TextInputType.visiblePassword,
                      label: "default_language",
                      hint: 'ar',
                      prefix: Icons.call_made,
                      onValidate: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your refail code';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultFormField(
                      controller: PasswordController,
                      type: TextInputType.visiblePassword,
                      label: "password",
                      hint: '********************',
                      prefix: Icons.lock_outline,
                      onValidate: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your Password';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultFormField(
                      controller: ConfirmPasswordController,
                      type: TextInputType.visiblePassword,
                      label: " Confirm pasword",
                      hint: '********************',
                      prefix: Icons.lock_outline,
                      onValidate: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please re enter Your Password';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ConditionalBuilder(
                    condition: state is! RegesterLoadingState,
                    builder: (context) => GreendefaultButton(
                      text: 'I Approve',
                      function: () {
                        if (formKey.currentState!.validate()) {
                          RegesterCubit.get(context).UserRegester(
                            date_of_birth: Date_of_birthController.text,
                            id_number: Id_NumberController.text,
                            mobile_number: Mobile_NumberController.text,
                            password_confirmation: PasswordController.text,
                            password: ConfirmPasswordController.text,
                            default_language: default_languageController.text,
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
          );
        },
      ),
    );
  }
}
