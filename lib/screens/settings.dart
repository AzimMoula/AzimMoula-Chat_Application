import 'package:flutter/material.dart';


class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white, fontSize: 50),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          ListView(children: const [])
        ],
      ),
    );
  }
}
