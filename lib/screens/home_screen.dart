import 'package:flutter/material.dart';
import 'package:projecthome/screens/login_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Home App",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w900,
          color: Colors.greenAccent
        ),
        ),
      ),


      body: Center(

        child: Padding(

          padding: EdgeInsets.all(20),

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[

              SizedBox(
                height: 200,
                child: Image.asset("assets/home_icon_2"),),

              Text("Welcome Back",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Colors.black
                ),
              ),

              Text("Name",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.greenAccent
                ),
              ),

              Text("Email",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.greenAccent
                ),
              ),

              Text("Contact",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.greenAccent
                ),
              ),


              ActionChip(label: Text("logout"), onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));

              }),


            ],


          ),

        ),


      ),

    );
  }
}
