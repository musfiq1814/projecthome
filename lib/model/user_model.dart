

class BestUser {
  String? uid;
  String? fname;
  String? lname;
  String? contact;
  String? email;

  BestUser({this.uid, this.email,this.contact, this.fname, this.lname});



  factory BestUser.fromMap(map)
  {
    return BestUser(
      uid: map['uid'],
      fname: map['fname'],
      lname: map['lname'],
      contact: map['contact'],
      email: map['email'],

    );
  }

  Map<String, dynamic> toMap(){

    return{

      'uid' : uid,
      'fname': fname,
      'lname': lname,
      'contact': contact,
      'email' : email,

    };

  }




}