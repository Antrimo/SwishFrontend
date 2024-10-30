import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class PictureBlock extends StatefulWidget {
  final double height;
  final double width;
  final Color blockColor;
  final Color textColor;
  final Icon icon;
  final Function(File) onImageSelected; // New callback function

  const PictureBlock({
    super.key,
    required this.blockColor,
    required this.textColor,
    required this.height,
    required this.width,
    required this.icon,
    required this.onImageSelected, // Initialize callback
  });

  @override
  State<PictureBlock> createState() => _PictureBlockState();
}

class _PictureBlockState extends State<PictureBlock> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpeg', 'jpg'],
    );
    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedImage = File(result.files.single.path!);
      });
      widget.onImageSelected(_selectedImage!); // Call callback with selected image
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Center(
        child: SizedBox(
          height: 180,
          width: 150,
          child: Center(
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  top: 20,
                  child: Container(
                    height: widget.height,
                    width: widget.width,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 15,
                  child: Container(
                    height: widget.height,
                    width: widget.width,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 10,
                  child: Container(
                    height: widget.height,
                    width: widget.width,
                    decoration: BoxDecoration(
                      color: widget.blockColor,
                      border: Border.all(width: 2, color: Colors.black),
                    ),
                    child: _selectedImage == null
                        ? widget.icon
                        : ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.zero),
                            child: Image.file(
                              _selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
