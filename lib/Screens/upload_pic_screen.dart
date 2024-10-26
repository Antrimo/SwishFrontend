import 'dart:io';

import 'package:flutter/material.dart';
import 'package:swish/Components/Blocks/picture_block.dart';
import 'package:swish/Components/Blocks/stack_block.dart';
import 'package:swish/Screens/gender_screen.dart';
import 'package:swish/Theme/color.dart';
import 'package:file_picker/file_picker.dart';

class UploadPicScreen extends StatefulWidget {
  const UploadPicScreen({super.key});

  @override
  State<UploadPicScreen> createState() => _UploadPicScreenState();
}

class _UploadPicScreenState extends State<UploadPicScreen> {
  File? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              'Give us your best shots!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                height: 297,
                width: 298,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: splashScreen, width: 2),
                ),
                child: GestureDetector(
                  onTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['png', 'jpeg', 'jpg'],
                    );
                    if (result != null && result.files.single.path != null) {
                      setState(() {
                        _selectedImage = File(result.files.single.path!);
                      });
                    }
                  },
                  child: _selectedImage == null
                      ? Center(
                          child: IconButton(
                            onPressed: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['png', 'jpeg', 'jpg'],
                              );
                              if (result != null &&
                                  result.files.single.path != null) {
                                setState(() {
                                  _selectedImage =
                                      File(result.files.single.path!);
                                });
                              }
                            },
                            icon: const Icon(Icons.add_a_photo),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            _selectedImage!,
                            fit: BoxFit.cover,
                            width: 298,
                            height: 297,
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: StackBlock(
                title: 'What should we call you?',
                screen: const UploadPicScreen(),
                blockColor: splashScreen,
                textColor: Colors.white,
                isAuth: false,
                height: 58,
                width: 280,
                isFunction: false,
                isWidth: false,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Add 2 more shots!'),
                SizedBox(width: 5),
                Icon(Icons.camera_enhance),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PictureBlock(
                  blockColor: Colors.white,
                  textColor: splashScreen,
                  height: 154,
                  width: 119,
                  icon: const Icon(Icons.add_a_photo),
                ),
                PictureBlock(
                  blockColor: Colors.white,
                  textColor: splashScreen,
                  height: 154,
                  width: 119,
                  icon: const Icon(Icons.add_a_photo),
                ),
              ],
            ),
            StackBlock(
              title: 'Continue',
              screen: const GenderScreen(),
              blockColor: splashScreen,
              textColor: Colors.white,
              isAuth: false,
              height: 58,
              width: 280,
              isFunction: false,
              isWidth: false,
            ),
          ],
        ),
      ),
    );
  }
}
