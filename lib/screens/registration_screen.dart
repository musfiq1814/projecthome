


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projecthome/model/user_model.dart';
import 'package:projecthome/screens/home_screen.dart';
import 'package:projecthome/screens/login_screen.dart';


class RegScreen extends StatefulWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {

  final _auth = FirebaseAuth.instance;

  //form key

  final _formkey = GlobalKey<FormState>();


  //editing controller


  final TextEditingController fnameController = new TextEditingController();
  final TextEditingController lnameController = new TextEditingController();
  final TextEditingController contactController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController = new TextEditingController();






  @override
  Widget build(BuildContext context) {

    // fields

    final fnamefield = TextFormField(
      autofocus: false,
      controller: fnameController,
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
        fnameController.text = value!;
      },

      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
          fillColor: Colors.blue,
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Enter your First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )



      ),




    );
    final lnamefield = TextFormField(
      autofocus: false,
      controller: lnameController,
      keyboardType: TextInputType.text,
      validator: (value){
        RegExp regex = new RegExp(r'^.{3,}$');

        if(value!.isEmpty)
        {
          return ("Second Name cannot be empty");
        }




      },
      onSaved: (value){
        lnameController.text = value!;
      },

      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
          fillColor: Colors.blue,
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Enter your Last Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )



      ),




    );

    final emailfield = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        if(value!.isEmpty){
          return ("please Enter Your Email");
        }

        // reg expression for email validation

        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value))
        {
          return ("Please return a valid email");
        }


        return null;



      },
      onSaved: (value){
        emailController.text = value!;
      },

      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
          fillColor: Colors.blue,
          prefixIcon: Icon(Icons.email),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Enter your Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )



      ),




    );

    final contactfield = TextFormField(
      autofocus: false,
      controller: contactController,
      keyboardType: TextInputType.phone,

      validator: (value){
        if(value!.isEmpty){
          return ("please Enter Your Contact");
        }



        return null;



      },
      onSaved: (value){
        contactController.text = value!;
      },

      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
          fillColor: Colors.blue,
          prefixIcon: Icon(Icons.phone),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Enter your Contact",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )



      ),




    );

    final passwordfield = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,

        validator: (value){

          RegExp regex = new RegExp(r'^.{6,}$');

          if(value!.isEmpty)
          {
            return ("Password Field cannot be empty");
          }

          if(!regex.hasMatch(value))
          {
            return("Please enter Minimum 6 char");
          }


        },
        onSaved: (value){
          passwordController.text = value!;
        },

        textInputAction: TextInputAction.next,


        decoration: InputDecoration(
            prefixIcon: Icon(Icons.vpn_key),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            fillColor: Colors.blue,
            hintText: "Enter your Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )
        )

    );

    final confirmpasswordfield = TextFormField(
        autofocus: false,
        controller: confirmPasswordController,
        obscureText: true,

        validator: (value){

          if(passwordController.text != confirmPasswordController.text ){

            return "password don't match";
          }
          else{
            return null;
          }

        },
        onSaved: (value){
          confirmPasswordController.text = value!;
        },

        textInputAction: TextInputAction.done,


        decoration: InputDecoration(
            prefixIcon: Icon(Icons.vpn_key),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            fillColor: Colors.blue,
            hintText: "Confirm your Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )
        )

    );



    final regButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.white,
      child: MaterialButton(


        onPressed: (){
          signUp(emailController.text, passwordController.text);
          //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },

        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        child: Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );


    return Scaffold(
      backgroundColor: Colors.blue,

      appBar: AppBar(

        backgroundColor: Colors.blueAccent,

        elevation: 0,

        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),



      ),



      body: Center(
        child: SingleChildScrollView(

          child: Container(
            color: Colors.blue,

            child: Padding(
              padding: EdgeInsets.all(36),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 200,
                      child: Image.asset("assets/home_icon_2"),),
                    SizedBox(height: 5),
                    fnamefield,
                    SizedBox(height: 5),
                    lnamefield,
                    SizedBox(height: 5),
                    contactfield,
                    SizedBox(height: 5),
                    emailfield,
                    SizedBox(height: 5),
                    passwordfield,
                    SizedBox(height: 5),
                    confirmpasswordfield,

                    SizedBox(height: 5),
                    regButton,
                    SizedBox(height: 5,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Text("Already have an account ? ",style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16
                        ),),
                        SizedBox(height: 5),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            "SignIn",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )


          ,
        ),


      ),
    );
  }

  void signUp(String email, String password) async{
    if(_formkey.currentState!.validate()){


      await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => postDetailstoFireStore(),

      ).catchError((e)
          {
            Fluttertoast.showToast(msg: e!.toString());
          }

      );
    }

  }


  postDetailstoFireStore() async{

    //calling firestore

    //calling model

    //sending value


    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


    User? user = _auth.currentUser;



    BestUser bestuser = BestUser();


    bestuser.email = user!.email;
    bestuser.uid = user.uid;
    bestuser.fname= fnameController.text;
    bestuser.lname = lnameController.text;
    bestuser.contact = contactController.text;

    
    await firebaseFirestore
    .collection("users")
    .doc(user.uid)
    .set(bestuser.toMap());
    
    Fluttertoast.showToast(msg: "Account created successfully");
    
    
    Navigator.pushAndRemoveUntil(
        (context),
      MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);


  }



}
