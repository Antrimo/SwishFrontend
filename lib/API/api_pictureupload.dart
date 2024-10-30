import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

Future<void> uploadImages(String uid, String name, List<File> images) async {
  var uri = Uri.parse(
      'http://limitless-sea-53782-1344bc525592.herokuapp.com/api/users/uploadImages');
  var request = http.MultipartRequest('POST', uri);

  request.fields['uid'] = uid;
  request.fields['name'] = name;

  for (var image in images) {
    var stream = http.ByteStream(image.openRead());
    var length = await image.length();
    var multipartFile = http.MultipartFile('images', stream, length,
        filename: basename(image.path));
    request.files.add(multipartFile);
  }
  var response = await request.send();
  if (response.statusCode == 200 || response.statusCode == 201) {
    print('Images uploaded successfully');
  } else {
    print('Failed to upload images. Status code: ${response.statusCode}');
  }
}
