import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InsertImage extends StatefulWidget {
  const InsertImage({Key? key}) : super(key: key);

  @override
  State<InsertImage> createState() => _InsertImageState();
}

XFile? _pickedFile;

class _InsertImageState extends State<InsertImage> {
  _getPhotoLibraryImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
    } else {
      if (kDebugMode) {
        print('이미지 선택안함');
      }
    }
  }

  // 카메라로 사진 업로드
  _getCameraImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
    } else {
      if (kDebugMode) {
        print('이미지 선택안함');
      }
    }
  }

  Uint8List fdsa = new Uint8List(0);

  // 이미지 base64로 전환
  postRequest(_pickedFile) async {
    File imageFile = File(_pickedFile.path);
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);

    fsda(base64Image);
    print(fdsa);
  }

  fsda(base64Image) {
    fdsa = base64Decode(base64Image);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
