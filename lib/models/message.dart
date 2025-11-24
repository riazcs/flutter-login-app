import 'package:namer_app/models/user.dart';

class Message {
  final int id;
  // final User sender;
  final String text;
  final bool isSentByMe;
  // final DateTime timestamp;

  // Message({required this.id, required this.text, required this.sender, required this.timestamp});
  Message({required this.id, required this.text, required this.isSentByMe});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      text: json['text'],
      isSentByMe: json['isSentByMe'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'isSentByMe': isSentByMe,
    };
  }
}
