
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projecthome/screens/home_screen.dart';
import 'package:projecthome/screens/registration_screen.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //form key

  final _formkey = GlobalKey<FormState>();


  //editing controller


  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //calling firebase

  final _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {

    // fields

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

      textInputAction: TextInputAction.done,


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


    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.white,
      child: MaterialButton(


        onPressed: (){
          //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          signIn(emailController.text, passwordController.text);
        },

        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        child: Text(
          "Login",
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
                    SizedBox(height: 45),
                    emailfield,
                    SizedBox(height: 20),
                    passwordfield,
                    SizedBox(height: 45),
                    loginButton,
                    SizedBox(height: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 50),
                        Text("Don't have an account ? ",style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16
                        ),),
                        SizedBox(height: 5),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegScreen()));
                          },
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 22,
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

  //login function



void signIn(String email, String password) async{


    if(_formkey.currentState!.validate()){

      await _auth.signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
            Fluttertoast.showToast(msg: "Login Successfull"),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomeScreen())),
        
        
        
      }).catchError((e)
        
        {
          Fluttertoast.showToast(msg: e!.toString());
        }
      
      );

    }
}





}
