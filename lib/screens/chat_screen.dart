import 'package:flutter/material.dart';
import 'package:namer_app/models/message.dart';
import 'package:namer_app/widgets/chat_bubble.dart';

class ChatScreen extends StatelessWidget {
  final List<Message> messages;

  ChatScreen({required this.messages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(message: messages[index]);
              },
            ),
          ),
          _buildMessageInputField(),
        ],
      ),
    );
  }

  Widget _buildMessageInputField() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(hintText: 'Type a message...'),
              // Add controller, onChanged, onSubmit, etc. as needed
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Handle send button tap
            },
          ),
        ],
      ),
    );
  }
}
