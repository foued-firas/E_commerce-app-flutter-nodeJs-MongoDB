import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

 Future<List<File>> pickImages() async {
    await requestPermissions(); // Ensure permissions are granted before proceeding

    List<File> images = [];
    try {
   var files =await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true,
      );

      if (files != null && files.files.isNotEmpty) {
        for (int i = 0; i < files.files.length; i++) {
          images.add(File(files.files[i].path!));
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return images;
  }
  Future<void> requestPermissions() async {
    if (await Permission.storage.request().isGranted) {
      // Permission is granted
      print("Storage permission granted");
    } else {
      // Permission is denied
      print("Storage permission denied");
    }
  }