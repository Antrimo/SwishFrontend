

  import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String apiUrl = 'http://limitless-sea-53782-1344bc525592.herokuapp.com/api/users/userInformation?uid=ioUtTHDS8HTteQEmnumyzcIY6j03';

  final TextEditingController dayController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

class Api {
  Future<void> sendData() async {
    String birthDate = "${yearController.text}-${monthController.text}-${dayController.text}";

    Map<String, dynamic> data = {
      "gender": "Male",  
      "preferredGender": "Female",
      "birthDate": birthDate,
      "height": '180', 
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        // Handle success
        print("Data sent successfully: ${response.body}");
      } else {
        // Handle error
        print("Failed to send data: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}