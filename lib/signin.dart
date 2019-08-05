import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'signup.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dashboard.dart';

class SignInClass extends StatefulWidget {
  SignInClass({this.auth});
  final BaseAuth auth;


  _SignInClassState createState() => _SignInClassState();
}

class _SignInClassState extends State<SignInClass> {
  final useremail = TextEditingController();
  final userPassword = TextEditingController();
  //final GoogleSignIn _googleSignIn = GoogleSignIn();
  //final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    useremail.dispose();
    userPassword.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // Padding(padding: EdgeInsets.only(), child: Image.asset('datafolder/image.jpeg', scale: 5,), )

                      Container(
                        padding: EdgeInsets.only(
                          top: 70,
                        ),
                        child: Text(
                          'Dr Maryam Log In Page',
                          style: TextStyle(color: Colors.green, fontSize: 22),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator:validationEmail,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Colors.blue,
                              ),
                              hintText: 'Enter Email Here'),
                          controller: useremail,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.blue,
                              ),
                              hintText: 'Enter Password Here'),
                          controller: userPassword,
                        ),
                      ),


                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: RaisedButton(
                          onPressed: () async {
                            String user= await widget.auth
                                .signInWithEmailandPassword(useremail.text, userPassword.text);
                            print('$user');
                            if(user!=null){
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder:(BuildContext context) =>

                                          DashboardScreen()));
                            }

                          },
                          color: Colors.blue,
                          child: Text(
                            'Log In',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment(-1, 0),
                        padding: EdgeInsets.only(top: 20),
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpClass(auth: Auth(), )),
                            );
                          },
                          color: Colors.blue,
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                          padding:
                              EdgeInsets.only(left: 30, right: 30, top: 10),
                          child: RaisedButton(
                            child: Text('sign in through Gmail'),
                            onPressed: ()  async{
                              String user =await widget.auth.signInWithGoogle();
                              print('$user');
                              if(user!=null){
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder:(BuildContext context) =>

                                            DashboardScreen()));
                              }
                          }
                          ))
                    ]))));
  }

  String validationEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter valid Email';
    else
      return null;
  }


}
