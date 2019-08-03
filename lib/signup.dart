import 'package:flutter/material.dart';
import 'signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dashboard.dart';

class SignUpClass extends StatefulWidget {
  SignUpClass({Key key}) : super(key: key);

  _SignUpClassState createState() => _SignUpClassState();
}

class _SignUpClassState extends State<SignUpClass> {
  final userName = TextEditingController();
  final userCNIC = TextEditingController();
  final userAdress = TextEditingController();
  final userContactNo = TextEditingController();
  final userEmail = TextEditingController();
  final userPassword = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    userName.dispose();
    userCNIC.dispose();
    userAdress.dispose();
    userContactNo.dispose();
    userEmail.dispose();
    userPassword.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(

        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 30, right: 30),
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
                    'Dr Maryam Sign Up  Page',
                    style: TextStyle(color: Colors.green, fontSize: 22),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          color: Colors.blue,
                        ),
                        hintText: 'Enter Name Here'),
                    controller: userName,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'CNIC',
                        labelStyle: TextStyle(
                          color: Colors.blue,
                        ),
                        hintText: 'Enter CNIC Here'),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Adress',
                        labelStyle: TextStyle(
                          color: Colors.blue,
                        ),
                        hintText: 'Enter Adress Here'),
                    controller: userAdress,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Contact No.',
                        labelStyle: TextStyle(
                          color: Colors.blue,
                        ),
                        hintText: 'Enter Contact No. Here'),
                    controller: userContactNo,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.blue,
                        ),
                        hintText: 'Enter Email Here'),
                    controller: userEmail,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
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
                      onPressed: () {
                        if (userEmail.text.isEmpty ||
                            userPassword.text.isEmpty) {
                          print("User email and password is null");
                        } else {
                          createuser();
                        }
                      },
                      color: Colors.blue,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      )),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInClass()),
                      );
                    },
                    color: Colors.blue,
                    child: Text(
                      'Back To Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> createuser() async {
    var user = await firebaseAuth.createUserWithEmailAndPassword(
        email: userEmail.text, password: userPassword.text);
    print(user);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DashboardScreen()),
    );
  }
}
