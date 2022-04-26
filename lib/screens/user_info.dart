



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';
import 'home_screen.dart';



class User_Info extends StatefulWidget {


  User_Info({Key? key}) : super(key: key);

  @override
  State<User_Info> createState() => _User_InfoState();

}

class _User_InfoState extends State<User_Info> {


  User? user = FirebaseAuth.instance.currentUser;

  BestUser loggedInUser= BestUser();

  @override
  void initState()
  {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then(

            (value){
          this.loggedInUser = BestUser.fromMap(value.data());

          setState(() { });
        }

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: const Text("Profile"),
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
          padding: EdgeInsets.all(20),

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,


            children: [

              SizedBox(
                height: 200,
                child: Image.asset("assets/home_icon_2"),),


              Text("Name: ${loggedInUser.fname} ${loggedInUser.lname}",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.greenAccent
                ),
              ),

              SizedBox(height: 10),

              Text("Email: ${loggedInUser.email}",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.greenAccent
                ),
              ),

              SizedBox(height: 10),

              Text("Contact: ${loggedInUser.contact}",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.greenAccent
                ),
              ),

              SizedBox(height: 10),

              Text("UID: ${loggedInUser.uid}",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    color: Colors.greenAccent
                ),
              ),


            ],



          ),


        ),
      ),
    );
  }
}
