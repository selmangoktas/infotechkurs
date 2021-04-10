import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSecView extends StatefulWidget {
  @override
  _ImageSecViewState createState() => _ImageSecViewState();
}

class _ImageSecViewState extends State<ImageSecView> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image seç'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: getImage,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                alignment: Alignment.center,
                width: 100,
                height: 50,
                child: Text(
                  'Image Seç',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Center(
              child: _image == null
                  ? Text('No image selected.')
                  : Image.file(_image),
            ),
          ],
        ),
      ),
    );
  }
}
