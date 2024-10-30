import 'dart:io';

import 'package:flutter/material.dart';
import 'package:swish/API/api_pictureupload.dart';
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
  File? _mainImage;
  File? _sideImage1;
  File? _sideImage2;
  bool _isLoading = false; 

  Future<void> _selectMainImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpeg', 'jpg'],
    );
    if (result != null && result.files.single.path != null) {
      setState(() {
        _mainImage = File(result.files.single.path!);
      });
    }
  }

  // Function to show an alert dialog
  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Image Selection"),
          content: const Text("Please select at least two images."),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          SingleChildScrollView(
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
                      onTap: _selectMainImage,
                      child: _mainImage == null
                          ? Center(
                              child: IconButton(
                                onPressed: _selectMainImage,
                                icon: const Icon(Icons.add_a_photo),
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                _mainImage!,
                                fit: BoxFit.cover,
                                width: 298,
                                height: 297,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Add 2 more shots!',
                  style: TextStyle(fontSize: 18),
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
                      onImageSelected: (image) {
                        setState(() {
                          _sideImage1 = image;
                        });
                      },
                    ),
                    PictureBlock(
                      blockColor: Colors.white,
                      textColor: splashScreen,
                      height: 154,
                      width: 119,
                      icon: const Icon(Icons.add_a_photo),
                      onImageSelected: (image) {
                        setState(() {
                          _sideImage2 = image;
                        });
                      },
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
                  isFunction: true,
                  isWidth: false,
                  apiCallback: () async {
                    int selectedImagesCount = [
                      _mainImage,
                      _sideImage1,
                      _sideImage2
                    ].where((image) => image != null).length;

                    if (selectedImagesCount >= 2) {
                      setState(() {
                        _isLoading = true; 
                      });

                      
                      Set<File?> setImageList = {_mainImage, _sideImage1, _sideImage2};
                      List<File> imageList = setImageList.whereType<File>().toList();
                      await uploadImages('ioUtTHDS8HTteQEmnumyzcIY6j03', 'ioUtTHDS8HTteQEmnumyzcIY6j03', imageList);

                      setState(() {
                        _isLoading = false; 
                      });

                      return true; 
                    } else {
                      _showAlertDialog();
                      return false; 
                    }
                  },
                ),
              ],
            ),
          ),
          
          if (_isLoading)
            Center(
              child: Container(
                color: Colors.black54,
                child: const CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
