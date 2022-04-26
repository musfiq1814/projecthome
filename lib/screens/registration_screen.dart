


import 'package:flutter/material.dart';
import 'package:projecthome/screens/login_screen.dart';


class RegScreen extends StatefulWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {

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
      //validator: (){},
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
      //validator: (){},
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

    final contactfield = TextFormField(
      autofocus: false,
      controller: contactController,
      keyboardType: TextInputType.phone,

      //validator: (){},
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

        //validator: (){},
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


        onPressed: (){},

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
                        Text("Don't have an account ? ",style: TextStyle(
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
}
