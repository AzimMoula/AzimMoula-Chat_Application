import 'package:flutter/material.dart';

class Storage extends StatelessWidget {
  const Storage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left, color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(31, 44, 52, 1),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
