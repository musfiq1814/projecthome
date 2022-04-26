

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class showAd extends StatefulWidget {

  String? userId;


  showAd({Key? key, this.userId}) : super(key: key);

  @override
  State<showAd> createState() => _showAdState();
}

class _showAdState extends State<showAd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("Your Image"),
        /*
        actions:
        [
          IconButton(
              onPressed: (){

                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomeScreen()));

                //Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back))],

         */

      ),

      body: StreamBuilder(

        stream: FirebaseFirestore.instance.collection("users").doc(widget.userId).collection("images").snapshots(),

        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return (Center(child: Text("No data"),));
          }
          else
            {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    String url = snapshot.data!.docs[index]['downloadURL'];
                    print(url);
                    return Image.network( url, height: 300, fit: BoxFit.cover, );
              });
            }
        }
        
        
      ),





    );
  }
}
