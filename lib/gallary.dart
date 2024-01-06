import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerScreen extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  List<XFile>? _pickedImages = []; // Store picked images
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _pickImages,
            child: Text('Pick Images'),
          ),
          SizedBox(height: 20),
          if (_pickedImages != null)
            Expanded(
              child: ListView.builder(
                itemCount: _pickedImages!.length,
                itemBuilder: (context, index) {
                  return Image.file(
                    File(_pickedImages![index].path),
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _pickImages() async {
    final status = await Permission.photos.request();

    if (status.isGranted) {
      List<XFile>? images = await _picker.pickMultiImage();

      if (images != null && images.isNotEmpty) {
        setState(() {
          _pickedImages = images;
        });

        // Save picked images to gallery
        _saveImagesToGallery(images);
      }
    } else {
      // Handle denied permissions
    }
  }

  Future<void> _saveImagesToGallery(List<XFile> images) async {
    for (var image in images) {
      // Save the image to the gallery
      await ImageGallerySaver.saveFile(image.path);
    }
  }
}

