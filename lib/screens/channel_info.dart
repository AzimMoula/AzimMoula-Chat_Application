import 'package:flutter/material.dart';

class ChannelInfo extends StatelessWidget {
  const ChannelInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          "Contact Info",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(31, 44, 52, 1),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Edit",
              ))
        ],
      ),
      body: const Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        radius: 60,
                      ),
                    ),
                    Text(
                      "Name",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Phone Number",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w200),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Card(
                    color: Color.fromRGBO(31, 44, 52, 1),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Icon(
                              Icons.chat_bubble_outline,
                              color: Color.fromRGBO(0, 168, 132, 1),
                            ),
                          ),
                          Text(
                            "Message",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Color.fromRGBO(31, 44, 52, 1),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Icon(
                              Icons.call,
                              color: Color.fromRGBO(0, 168, 132, 1),
                            ),
                          ),
                          Text(
                            "Audio",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Color.fromRGBO(31, 44, 52, 1),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Icon(
                              Icons.videocam_outlined,
                              color: Color.fromRGBO(0, 168, 132, 1),
                            ),
                          ),
                          Text(
                            "Video",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Color.fromRGBO(31, 44, 52, 1),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Icon(
                              Icons.search_rounded,
                              color: Color.fromRGBO(0, 168, 132, 1),
                            ),
                          ),
                          Text(
                            "Search",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Card(
                color: Color.fromRGBO(31, 44, 52, 1),
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                        "time",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
