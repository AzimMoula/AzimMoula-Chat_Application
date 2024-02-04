import 'package:csi_stream/widgets/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChannelInfo extends StatelessWidget {
  ChannelInfo({super.key, required this.channel});
  final client = StreamChatClient('pgngfnbpjdf2', logLevel: Level.INFO);
  final Channel channel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            )),
        title: const Text(
          "Contact Info",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(31, 44, 52, 1),
      ),
      body: Column(
        children: [
          StreamChannelInfoBottomSheet(
            channel: channel,
            // onMemberTap: (Member member) => showModalBottomSheet(
            //   context: context,
            //   elevation: 10,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10.0),
            //   ),
            //   builder: (BuildContext context) {
            //     return SizedBox(
            //       width: double.maxFinite,
            //       height: 200,
            //       child: Center(
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: <Widget>[
            //             ListTile(
            //                 leading: const Icon(Icons.delete),
            //                 onTap: () {
            //                   channel.removeMembers([
            //                     member.user!.id,
            //                   ]);
            //                   Navigator.pop(context);
            //                 },
            //                 title: const Text("Remove Member")),
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            // ),
            onViewInfoTap: () => (context: context, channel: channel),
            onLeaveChannelTap: () {
              channel.removeMembers([StreamChat.of(context).currentUser!.id]);
              Navigator.pop(context);
              Navigator.pop(context);
            },
            onDeleteConversationTap: () => showDialog<String>(
              context: context,
              barrierColor: const Color.fromRGBO(155, 10, 10, 0.5),
              builder: (BuildContext context) => Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 15),
                      const Text(
                        "Do you really want to delete this Chat?!\nThis can't be undone!",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () {
                          channel.delete();
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text('DELETE'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      // Column(
      //   children: [
      //     SizedBox(
      //       width: double.maxFinite,
      //       child: Padding(
      //         padding: const EdgeInsets.all(15.0),
      //         child: Card(
      //           elevation: 0,
      //           color: Colors.transparent,
      //           child: Column(
      //             children: [
      //               Padding(
      //                   padding: const EdgeInsets.all(15.0),
      //                   child: StreamChannelAvatar(
      //                     channel: channel,
      //                   )),
      //               Text(
      //                 channel.id!,
      //                 style: const TextStyle(
      //                     fontSize: 25,
      //                     color: Colors.white,
      //                     fontWeight: FontWeight.bold),
      //               ),
      //               const Text(
      //                 "Phone Number",
      //                 style: TextStyle(
      //                     fontSize: 15,
      //                     color: Colors.grey,
      //                     fontWeight: FontWeight.w200),
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     const Padding(
      //       padding: EdgeInsets.all(5.0),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Expanded(
      //             child: Card(
      //               color: Color.fromRGBO(31, 44, 52, 1),
      //               child: Padding(
      //                 padding: EdgeInsets.all(10.0),
      //                 child: Column(
      //                   children: [
      //                     Padding(
      //                       padding: EdgeInsets.all(20.0),
      //                       child: Icon(
      //                         Icons.chat_bubble_outline,
      //                         color: Color.fromRGBO(0, 168, 132, 1),
      //                       ),
      //                     ),
      //                     Text(
      //                       "Message",
      //                       style: TextStyle(
      //                           fontSize: 10,
      //                           color: Colors.white,
      //                           fontWeight: FontWeight.w200),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Expanded(
      //             child: Card(
      //               color: Color.fromRGBO(31, 44, 52, 1),
      //               child: Padding(
      //                 padding: EdgeInsets.all(10.0),
      //                 child: Column(
      //                   children: [
      //                     Padding(
      //                       padding: EdgeInsets.all(20.0),
      //                       child: Icon(
      //                         Icons.call,
      //                         color: Color.fromRGBO(0, 168, 132, 1),
      //                       ),
      //                     ),
      //                     Text(
      //                       "Audio",
      //                       style: TextStyle(
      //                           fontSize: 10,
      //                           color: Colors.white,
      //                           fontWeight: FontWeight.w200),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Expanded(
      //             child: Card(
      //               color: Color.fromRGBO(31, 44, 52, 1),
      //               child: Padding(
      //                 padding: EdgeInsets.all(10.0),
      //                 child: Column(
      //                   children: [
      //                     Padding(
      //                       padding: EdgeInsets.all(20.0),
      //                       child: Icon(
      //                         Icons.videocam_outlined,
      //                         color: Color.fromRGBO(0, 168, 132, 1),
      //                       ),
      //                     ),
      //                     Text(
      //                       "Video",
      //                       style: TextStyle(
      //                           fontSize: 10,
      //                           color: Colors.white,
      //                           fontWeight: FontWeight.w200),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Expanded(
      //             child: Card(
      //               color: Color.fromRGBO(31, 44, 52, 1),
      //               child: Padding(
      //                 padding: EdgeInsets.all(10.0),
      //                 child: Column(
      //                   children: [
      //                     Padding(
      //                       padding: EdgeInsets.all(20.0),
      //                       child: Icon(
      //                         Icons. _rounded,
      //                         color: Color.fromRGBO(0, 168, 132, 1),
      //                       ),
      //                     ),
      //                     Text(
      //                       "Search",
      //                       style: TextStyle(
      //                           fontSize: 10,
      //                           color: Colors.white,
      //                           fontWeight: FontWeight.w200),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     const SizedBox(
      //       width: double.maxFinite,
      //       child: Padding(
      //         padding: EdgeInsets.all(5.0),
      //         child: Card(
      //           color: Color.fromRGBO(31, 44, 52, 1),
      //           child: Padding(
      //             padding: EdgeInsets.all(25.0),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   "Description",
      //                   style: TextStyle(color: Colors.white, fontSize: 15),
      //                 ),
      //                 Text(
      //                   "time",
      //                   style: TextStyle(color: Colors.grey, fontSize: 10),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
