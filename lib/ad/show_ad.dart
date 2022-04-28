

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class showAd extends StatefulWidget {

  String? userId;

  String? userName;


  showAd({Key? key, this.userId, this.userName}) : super(key: key);

  @override
  State<showAd> createState() => _showAdState();
}

class _showAdState extends State<showAd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("Posts"),
        actions:
        [
          IconButton(
              onPressed: (){

                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomeScreen()));

                //Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back))],

      ),

      body: Container(
        color: Colors.white70,
        child: StreamBuilder(
          

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
                      String url = snapshot.data!.docs[index]['downlodURL'];
                      String title = snapshot.data!.docs[index]['title'];
                      String location = snapshot.data!.docs[index]['location'];
                      String bed = snapshot.data!.docs[index]['bed'];
                      String bath = snapshot.data!.docs[index]['bath'];
                      String varanda = snapshot.data!.docs[index]['varanda'];
                      String price = snapshot.data!.docs[index]['price'];
                      String userID = snapshot.data!.docs[index]['userID'];


                      //return Image.network( url, height: 300, fit: BoxFit.cover, );

                      return Center(
                          child: Padding(
                          padding: EdgeInsets.all(20),

                      child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,


                      children: [

                        SizedBox(
                          height: 150,
                          width: 300,
                          child: Image.network( url, height: 300, fit: BoxFit.cover, ),
                        ),

                        SizedBox(height: 10),

                        Row(
                          children: [


                            Text("Title : ",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black
                              ),
                            ),

                            Text("${title}",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.lightBlueAccent
                              ),
                            ),




                          ],
                        ),

                        Row(
                          children: [

                            Text("Bed : ",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black
                              ),
                            ),

                            Text("${bed}",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.greenAccent
                              ),
                            ),




                          ],
                        ),
                        Row(
                          children: [

                            Text("Bath : ",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black
                              ),
                            ),

                            Text("${bath}",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.greenAccent
                              ),
                            ),




                          ],
                        ),

                        Row(
                          children: [

                            Text("Varanda : ",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black
                              ),
                            ),

                            Text("${varanda}",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.greenAccent
                              ),
                            ),




                          ],
                        ),

                        Row(
                          children: [

                            Text("Location : ",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black
                              ),
                            ),

                            Text("${location}",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.greenAccent
                              ),
                            ),




                          ],
                        ),

                        Row(
                          children: [

                            Text("Price : ",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black
                              ),
                            ),

                            Text("${price}",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.lightBlueAccent
                              ),
                            ),




                          ],
                        ),

                        Row(
                          children: [

                            Text("Prosted By : ",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black
                              ),
                            ),
                            Text("${userID}",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.greenAccent
                              ),
                            ),





                          ],
                        ),





                        ]
                      )
                      )
                      );

                });
              }
          }
          
          
        ),
      ),





    );
  }
}
