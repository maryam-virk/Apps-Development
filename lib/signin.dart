import 'package:flutter/material.dart';
import 'signup.dart';



class SignInClass extends StatefulWidget {
  SignInClass({Key key}) : super(key: key);

  _SignInClassState createState() => _SignInClassState();
}

class _SignInClassState extends State<SignInClass> {
  final useremail=TextEditingController();
  final userPassword=TextEditingController();
  @override
  void dispose(){
    super.dispose();
    useremail.dispose();
    userPassword.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
body: SingleChildScrollView( child:
  Container(
    padding: EdgeInsets.only(left: 20, right: 20),
  
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[

     // Padding(padding: EdgeInsets.only(), child: Image.asset('datafolder/image.jpeg', scale: 5,), )

     Container(padding: EdgeInsets.only(top: 70,), child: Text('Dr Maryam Log In Page', style: TextStyle(color: Colors.green, fontSize: 22),), ),

Padding(padding: EdgeInsets.only(top: 20), child: TextFormField( keyboardType: TextInputType.emailAddress, decoration: InputDecoration(labelText: 'Email', labelStyle: TextStyle(color: Colors.blue,), hintText: 'Enter Email Here'),controller: useremail,),),

Padding(padding: EdgeInsets.only(top: 20), child: TextFormField( keyboardType: TextInputType.text, decoration: InputDecoration(labelText: 'Password', labelStyle: TextStyle(color: Colors.blue,), hintText: 'Enter Password Here'), controller: userPassword,),),

Padding(padding: EdgeInsets.only(top: 20), child: RaisedButton(onPressed: (){},  color: Colors.blue,  child: Text('Log In', style: TextStyle(color: Colors.white), ),), ),
Container(  alignment: Alignment(-1, 0),  padding: EdgeInsets.only(top: 20),child: FlatButton(onPressed: (){}, child: Text('Forgot Password', style: TextStyle(color: Colors.grey),), ),  ),


Padding(padding: EdgeInsets.only(top: 20), child: RaisedButton(onPressed: (){  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpClass()),
            );  },  color: Colors.blue,  child: Text('Register', style: TextStyle(color: Colors.white), ),), ),




    ],
  ),
),
)
    );
  }
}