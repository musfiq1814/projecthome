
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// textInput for post title

// textInput for location

// textInput for post type

// image picker for picking the image

// firebase storage for uploading image to firebase

// cloud firestore for saving url of image

// saving url


import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class postAd extends StatefulWidget {
  const postAd({Key? key}) : super(key: key);

  @override
  State<postAd> createState() => _postAdState();
}

class _postAdState extends State<postAd> {


  // some initialization code


  File? _image;

  final imagepicker = ImagePicker();

  // image picker


  Future ImagePickerMethod() async{

    final pick = await imagepicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if(pick!=null){
        _image = File(pick.path);
      }
      else{
        // show snackbar
        showSnackBar("No Image Selected", Duration(milliseconds: 400));
      }
    });



  }


  showSnackBar(String snackText , Duration d){

    final snackBar = SnackBar(content: Text(snackText), duration: d,);

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Ad"),
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),

          child: ClipRRect(

            borderRadius: BorderRadius.circular(30),

            child: SizedBox(
              height: 500,
              width: double.infinity,

              child: Column(

                children: [

                  Text("Upload Image"),

                  SizedBox(height: 10),

                  Expanded(
                      flex: 4,
                      child: Container(
                        width: 320,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.red)
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Expanded(
                                  child: _image ==null ? const Center(child: Text("no image slelcted"),) : Image.file(_image!),
                              ),
                              
                              
                              ElevatedButton(onPressed: (){
                                ImagePickerMethod();
                              }, child: Text("Select Image")),

                              ElevatedButton(onPressed: (){}, child: Text("Post")),


                            ],
                          ),
                        ),
                  )

                  ),

                ],
              ),



            ),

          ),


        ),
      ),
    );
  }
}
