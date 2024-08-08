import 'dart:io';

import 'package:amazon/constants/utils.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';

class AdminServices{
  void sellProduct({
    required BuildContext context ,
    required String name ,
    required String description ,
    required double price ,
    required double quantity ,
    required String category ,
    required List<File> images,



  })async{
    try{
      final cloudinary = CloudinaryPublic('dep91botc', 'lhlzz5wo');
      List<String> imageUrls=[];
      for(int i=0;i<images.length ;i++){
      CloudinaryResponse res =  await cloudinary.uploadFile(
        CloudinaryFile.fromFile(images[i].path, folder: name ),
        );
        imageUrls.add(res.secureUrl);
      }
          }catch(e){
      showSnackBar(context, e.toString());
    }
  }
}