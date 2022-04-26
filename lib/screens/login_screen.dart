
import 'package:flutter/material.dart';



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






  @override
  Widget build(BuildContext context) {

    // fields

    final emailfield = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      //validator: (){},
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

      //validator: (){},
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
      color: Colors.blueAccent,
      child: MaterialButton(


        onPressed: (){},

        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
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
                            fontSize: 14
                        ),),
                        SizedBox(height: 5),
                        GestureDetector(
                          onTap: (){},
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
}
