import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/USER/Login/cubit/Login_Cubit.dart';
import 'package:flutter_application_2/presentation/USER/Login/cubit/Login_States.dart';
import 'package:flutter_application_2/presentation/Home/Home/Screen/home_view.dart';
import 'package:flutter_application_2/presentation/USER/Regester/regester_view.dart';
import 'package:flutter_application_2/components/component.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var typeController = TextEditingController();
  var id_numberController = TextEditingController();
  var passwordController = TextEditingController();
  var device_tokenController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccesState) {
            navigateAndFinish(context, HomeView());
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: formKey,
              child: ListView(
                children: [
                  Container(
                    height: 100,
                    child: Center(
                      child: Image.asset(
                        "assets/images/Group 19.png",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Center(
                        child: Text(
                      "We Trust",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultFormField(
                      controller: id_numberController,
                      type: TextInputType.visiblePassword,
                      label: " id_number",
                      hint: '123456789',
                      prefix: Icons.lock_outline,
                      onValidate: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Your phone';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      label: "  pasword",
                      hint: '********************',
                      suffix: LoginCubit.get(context).suffix,
                      isPassword: LoginCubit.get(context).isPassword,
                      prefix: Icons.lock_outline,
                      suffixPressed: () {
                        LoginCubit.get(context).changePasswordVisibility();
                      },
                      onValidate: (String? value) {
                        if (value == null || value.isEmpty) {
                          return '  enter Your Password';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultFormField(
                      controller: device_tokenController,
                      type: TextInputType.visiblePassword,
                      label: " device_token",
                      hint: '25478',
                      prefix: Icons.lock_outline,
                      onValidate: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter device_token';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultFormField(
                      controller: typeController,
                      type: TextInputType.visiblePassword,
                      label: " type",
                      hint: 'ios',
                      prefix: Icons.merge_type,
                      onValidate: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please  enter Your type';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: Text("forgot password?"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ConditionalBuilder(
                    condition: state is! LoginLoadingState,
                    builder: (context) => GreendefaultButton(
                      text: 'Login',
                      radius: 20,
                      function: () {
                        if (formKey.currentState!.validate()) {
                          LoginCubit.get(context).userLogin(
                            password: passwordController.text,
                            id_number: id_numberController.text,
                            device_token: device_tokenController.text,
                            type: typeController.text,
                          );
                        }
                      },
                      isUpperCase: true,
                    ),
                    fallback: (context) =>
                        Center(child: CircularProgressIndicator()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  defaultButton(
                      text: 'Sign Up',
                      radius: 20,
                      function: () {
                        navigateTo(context, RegesterView());
                      }),
                  SizedBox(
                    height: 70,
                  ),
                  defaultButton(text: 'I Approve', radius: 20, function: () {})
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
