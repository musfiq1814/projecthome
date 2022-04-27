
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

import '../screens/home_screen.dart';




class postAd extends StatefulWidget {


  // we need the user id to create a image folder for a perticular user

  String? userId;

  postAd({Key? key, this.userId}) : super(key: key);

  @override
  State<postAd> createState() => _postAdState();
}

class _postAdState extends State<postAd> {


  // some initialization code


  final _formkey = GlobalKey<FormState>();


  //editing controller


  final TextEditingController titleController = new TextEditingController();
  final TextEditingController priceController = new TextEditingController();
  final TextEditingController bedController = new TextEditingController();
  final TextEditingController bathController = new TextEditingController();
  final TextEditingController varandaController = new TextEditingController();
  final TextEditingController locationController = new TextEditingController();


  File? _image;

  final imagepicker = ImagePicker();

  String? downloadURL;

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


  Future uploadPost() async{

    final postID = DateTime.now().millisecondsSinceEpoch.toString();

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    Reference ref = FirebaseStorage.instance.ref().child("${widget.userId}/posts").child("post_$postID");

    await ref.putFile(_image!);


    downloadURL = await ref.getDownloadURL();

    //print(downloadURL);



    await firebaseFirestore.collection("users").doc(widget.userId).collection("images").add({
      'downlodURL': downloadURL,
      'title': titleController.text,
      'price': priceController.text,
      'bed': bedController.text,
      'bath': bathController.text,
      'varanda': varandaController.text,
      'location': locationController.text,
      'userID': widget.userId,
    }).whenComplete(() => showSnackBar("Uploaded SUccessfully", Duration(seconds: 2)));




  }









  showSnackBar(String snackText , Duration d){

    final snackBar = SnackBar(content: Text(snackText), duration: d,);

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }


  @override
  Widget build(BuildContext context) {


    final titlefield = TextFormField(
      autofocus: false,
      controller: titleController,
      keyboardType: TextInputType.text,
      validator: (value){

        RegExp regex = new RegExp(r'^.{3,}$');

        if(value!.isEmpty)
        {
          return ("First Name cannot be empty");
        }
        if(!regex.hasMatch(value))
        {
          return ("Please return a valid email min 3 char");
        }

        return null;


      },
      onSaved: (value){
        titleController.text = value!;
      },

      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
          fillColor: Colors.blue,
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Enter Title",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )



      ),




    );

    final prizefield = TextFormField(
      autofocus: false,
      controller: priceController,
      keyboardType: TextInputType.text,
      validator: (value){

        RegExp regex = new RegExp(r'^.{3,}$');

        if(value!.isEmpty)
        {
          return ("Price cannot be empty");
        }
        if(!regex.hasMatch(value))
        {
          return ("Please return a valid Price min 3 char");
        }

        return null;


      },
      onSaved: (value){
        priceController.text = value!;
      },

      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
          fillColor: Colors.blue,
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Enter Price",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )



      ),




    );

    final bedfield = TextFormField(
      autofocus: false,
      controller: bedController,
      keyboardType: TextInputType.text,
      validator: (value){

        RegExp regex = new RegExp(r'^.{3,}$');

        if(value!.isEmpty)
        {
          return ("Bed number cannot be empty");
        }
        if(!regex.hasMatch(value))
        {
          return ("Please return a valid bed");
        }

        return null;


      },
      onSaved: (value){
        bedController.text = value!;
      },

      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
          fillColor: Colors.blue,
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Enter Number of bed",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )



      ),




    );

    final bathfield = TextFormField(
      autofocus: false,
      controller: bathController,
      keyboardType: TextInputType.text,
      validator: (value){

        RegExp regex = new RegExp(r'^.{3,}$');

        if(value!.isEmpty)
        {
          return ("Bath Number cannot be empty");
        }

        return null;


      },
      onSaved: (value){
        bathController.text = value!;
      },

      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
          fillColor: Colors.blue,
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Enter Number of Bath",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )



      ),




    );


    final varandafield = TextFormField(
      autofocus: false,
      controller: varandaController,
      keyboardType: TextInputType.text,
      validator: (value){

        RegExp regex = new RegExp(r'^.{10,}$');


        return null;


      },
      onSaved: (value){
        locationController.text = value!;
      },

      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
          fillColor: Colors.blue,
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Enter Number of varanda",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )



      ),




    );



    final locationfield = TextFormField(
      autofocus: false,
      controller: locationController,
      keyboardType: TextInputType.text,
      validator: (value){

        RegExp regex = new RegExp(r'^.{10,}$');

        if(value!.isEmpty)
        {
          return ("Location cannot be empty");
        }
        if(!regex.hasMatch(value))
        {
          return ("Please return a valid email min 10 char");
        }

        return null;


      },
      onSaved: (value){
        locationController.text = value!;
      },

      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
          fillColor: Colors.blue,
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Enter your Location",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )



      ),




    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Post Ad"),

        actions:
        [
          IconButton(
              onPressed: (){

                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomeScreen()));

                //Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back))],


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

                              titlefield,
                              SizedBox(height: 5),
                              prizefield,
                              SizedBox(height: 5),
                              bedfield,
                              SizedBox(height: 5),
                              bathfield,
                              SizedBox(height: 5),
                              varandafield,
                              SizedBox(height: 5),
                              locationfield,
                              SizedBox(height: 5,),

                              Expanded(
                                  child: _image ==null ? const Center(child: Text("no image slelcted"),) : Image.file(_image!),
                              ),
                              
                              
                              ElevatedButton(onPressed: (){
                                ImagePickerMethod();
                              }, child: Text("Select Image")),

                              ElevatedButton(
                                  onPressed: (){

                                    if(_image!=null){
                                      uploadPost().whenComplete(() => showSnackBar("Posted Successfully", Duration(seconds: 2)));
                                    }
                                    else
                                      {
                                        showSnackBar("No Image Selected ", Duration(milliseconds: 400));
                                      }

                              }, child: Text("Post")),


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
