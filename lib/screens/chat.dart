import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class Chat extends StatelessWidget {
  const Chat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StreamChannelHeader(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamMessageListView(
              threadBuilder: (_, parentMessage) => ThreadPage(
                parent: parentMessage!,
              ),
            ),
          ),
          const StreamMessageInput(),
        ],
      ),
    );
  }
}

class ThreadPage extends StatefulWidget {
  const ThreadPage({
    super.key,
    this.parent,
  });

  final Message? parent;

  @override
  State<ThreadPage> createState() => _ThreadPageState();
}

class _ThreadPageState extends State<ThreadPage> {
  late final _controller = StreamMessageInputController(
    message: Message(parentId: widget.parent?.id),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StreamThreadHeader(
        parent: widget.parent!,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamMessageListView(
              parentMessage: widget.parent,
            ),
          ),
          StreamMessageInput(
            messageInputController: _controller,
          ),
        ],
      ),
    );
  }
}
