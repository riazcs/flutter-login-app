import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthenticationService {
  static Future<bool> login(String email, String password) async {
    try {
      // Make a POST request to your backend API for login
      final response = await http.post(
        Uri.parse('https://texmeta.local/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // If login successful, return true
        return true;
      } else {
        // If login failed, return false
        return false;
      }
    } catch (e) {
      // If an error occurs during login, return false
      print('Error during login: $e');
      return false;
    }
  }
  static Future<bool> signUp(String email, String password) async {
    try {
      // Make a POST request to your backend API for login
      final response = await http.post(
        Uri.parse('http://texmeta.local/api/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // If login successful, return true
        return true;
      } else {
        // If login failed, return false
        return false;
      }
    } catch (e) {
      // If an error occurs during login, return false
      print('Error during login: $e');
      return false;
    }
  }
}
