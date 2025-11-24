import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:namer_app/models/message.dart';

class ChatService {
  static Future<List<Message>> fetchMessages() async {
    try {
      // Make a GET request to fetch chat messages from the backend API
      final response = await http.get(Uri.parse('https://your-backend-api.com/messages'));

      if (response.statusCode == 200) {
        // If request is successful, parse response JSON and return messages
        Iterable<dynamic> jsonMessages = jsonDecode(response.body);
        List<Message> messages = jsonMessages.map((json) => Message.fromJson(json)).toList();
        return messages;
      } else {
        // If request fails, throw an exception
        throw Exception('Failed to fetch messages');
      }
    } catch (e) {
      // If an error occurs during the request, throw an exception
      throw Exception('Error during fetchMessages: $e');
    }
  }

  static Future<bool> sendMessage(Message message) async {
    try {
      // Make a POST request to send a chat message to the backend API
      final response = await http.post(
        Uri.parse('https://your-backend-api.com/send-message'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(message.toJson()),
      );

      if (response.statusCode == 200) {
        // If message sent successfully, return true
        return true;
      } else {
        // If message sending fails, return false
        return false;
      }
    } catch (e) {
      // If an error occurs during sending message, return false
      print('Error during sendMessage: $e');
      return false;
    }
  }
}
