// ignore_for_file: unused_import

import 'package:csi_stream/widgets/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController _name = TextEditingController();
  final TextEditingController _imgurl = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final appBarHeight = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    // double widthDev = MediaQuery.of(context).size.width;
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
            bottom: const TabBar(
              dividerColor: Color.fromRGBO(31, 44, 52, 1),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Color.fromRGBO(0, 168, 132, 1),
              tabAlignment: TabAlignment.center,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
                Tab(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontWeight: FontWeight.w900),
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

                            Navigator.pushReplacementNamed(context, '/home');
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton.filled(
                              onPressed: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => Dialog(
                                      backgroundColor:
                                          const Color.fromRGBO(18, 27, 34, 1),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            CustomTextInput(
                                                controller: _imgurl,
                                                icon: const Icon(
                                                  Icons.image_rounded,
                                                  color: Colors.white,
                                                ),
                                                isObscure: false,
                                                hint: "Enter image url"),
                                            const SizedBox(height: 15),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Close'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              icon: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.image, size: 30),
                              )),
                          CustomTextInput(
                              controller: _name,
                              icon: const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 40,
                              ),
                              isObscure: false,
                              hint: "Enter your Name"),
                        ],
                      ),
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
                            Navigator.pushReplacementNamed(context, '/home');
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
