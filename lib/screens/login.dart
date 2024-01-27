// ignore_for_file: unused_import

import 'package:csi_stream/widgets/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final appBarHeight = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    double widthDev = MediaQuery.of(context).size.width;
    double heightDev = MediaQuery.of(context).size.height;

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: heightDev / 4,
            title: const Text(
              'WhatsApp',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: const Color.fromRGBO(31, 44, 52, 1),
            bottom: TabBar(
              dividerColor: const Color.fromRGBO(31, 44, 52, 1),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: const Color.fromRGBO(0, 168, 132, 1),
              tabAlignment: TabAlignment.center,
              tabs: <Widget>[
                SizedBox(
                  width: widthDev / 10,
                  child: const Tab(
                    child: Text(
                      "Sign In",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                SizedBox(
                  width: widthDev / 10,
                  child: const Tab(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: const Color.fromRGBO(18, 27, 34, 1),
          body: TabBarView(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    children: [
                      CustomTextInput(
                          controller: _username,
                          icon: const Icon(
                            Icons.account_circle,
                            color: Color.fromRGBO(201, 204, 202, 1),
                            size: 40,
                          ),
                          isObscure: false,
                          hint: "Enter your Username"),
                      CustomTextInput(
                          controller: _password,
                          icon: const Icon(
                            Icons.password_rounded,
                            color: Color.fromRGBO(201, 204, 202, 1),
                            size: 40,
                          ),
                          isObscure: true,
                          hint: "Enter your password"),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // final userid = _username.text;

                            Navigator.pushNamed(context, '/home');
                            // * Navigate to Home Screen
                          },
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(18, 27, 34, 1),
                          )),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Sign In",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    children: [
                      CustomTextInput(
                          controller: _username,
                          icon: const Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: 40,
                          ),
                          isObscure: false,
                          hint: "Enter a Username"),
                      CustomTextInput(
                          controller: _password,
                          icon: const Icon(
                            Icons.password_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                          isObscure: true,
                          hint: "Enter a Password"),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(18, 27, 34, 1),
                          )),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
