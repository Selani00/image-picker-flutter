import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tese_journey/components/app_images.dart';
import 'dart:io';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;
  String? _imagepath;

  @override
  void initState() {
    super.initState();
    LoadImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Picker Example')),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _imagepath != null && _imagepath!.isNotEmpty
                  ? CircleAvatar(
                      backgroundImage: FileImage(File(_imagepath!)),
                      radius: 80,
                    )
                  : CircleAvatar(
                      backgroundImage: _image != null
                          ? FileImage(_image!)
                          : AssetImage(AppImages.image)
                              as ImageProvider<Object>?,
                      radius: 80,
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    pickImage();
                  },
                  child: Text('Pick Image'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    SaveImage(_image?.path);
                  },
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        _imagepath = pickedImage.path;
      });
    }
  }

  Future<void> SaveImage(path) async {
    SharedPreferences saveImage = await SharedPreferences.getInstance();
    saveImage.setString("imagepath", path);
  }

  Future<void> LoadImage() async {
    SharedPreferences saveImage = await SharedPreferences.getInstance();
    setState(() {
      _imagepath = saveImage.getString("imagepath");
    });
  }
}
