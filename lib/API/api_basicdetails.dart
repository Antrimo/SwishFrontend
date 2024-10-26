import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String apiUrl =
    'http://limitless-sea-53782-1344bc525592.herokuapp.com/api/users/userInformation?uid=ioUtTHDS8HTteQEmnumyzcIY6j03';

final TextEditingController dayController = TextEditingController();
final TextEditingController monthController = TextEditingController();
final TextEditingController yearController = TextEditingController();

class Api {
  Future<void> sendData(String gender, String preferredGender, String birthDate,
      int height) async {
    print("Sending data:");
    print("Gender: $gender");
    print("Preferred Gender: $preferredGender");
    print("Birth Date: $birthDate");
    print("Height: $height");
    // String birthDate =
    //     "${yearController.text}-${monthController.text}-${dayController.text}";

    Map<String, dynamic> data = {};

    if (gender != "Unknown") {
      data["gender"] = gender;
    }
    if (preferredGender != "Unknown") {
      data["preferredGender"] = preferredGender;
    }
    if (birthDate != "0000-00-00") {
      data["birthDate"] = birthDate;
    }
    if (height > 0) {
      // Assuming height should be a positive value
      data["height"] = height;
    }

    try {
      print(data);
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(data),
      );

      if (response.statusCode == 201) {
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
