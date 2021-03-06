import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:innobuzz/Pages/home.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
//            Container(
//              height: 400,
//              child:Stack(
//                children: <Widget>[
//                  Positioned(
//                    //top = -40,
//                    height: 395,
//                    width: width,
//                    child: Container(
//                      decoration: BoxDecoration(
//                          image: DecorationImage(
//                              image: AssetImage('assets/images/logbg1.png'),
//                              fit: BoxFit.fill
//                          )
//                      ),
//                    ),
//                  ),
//                  Positioned(
//                    height: 445,
//                    width: width+20,
//                    child: Container(
//                      decoration: BoxDecoration(
//                          image: DecorationImage(
//                              image: AssetImage('assets/images/logbg2.png'),
//                              fit: BoxFit.fill
//                          )
//                      ),
//                    ),
//                  )
//
//                ],
//              ),
//            ),
            //SizedBox(height: 40),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Create Account", style: TextStyle(color: Color.fromRGBO(250, 75, 0, 1), fontWeight: FontWeight.bold, fontSize: 30),),
                  SizedBox(height: 30),
                  Container(

                    //padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(250, 75, 0, .3),
                            blurRadius: 20,
                            offset: Offset(0, 10),

                          )
                        ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(
                                  color: Colors.grey[100]
                              ))
                          ),
                          child: TextFormField(
                            validator: (input) { // ignore: missing_return
                              if(input.isEmpty){
                                return 'Please type email';
                              }
                            },
                            onSaved: (input) => _email = input,
                            decoration: InputDecoration(
                                labelText: 'Email id',
                                labelStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none
                            ),

                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(
                                  color: Colors.grey[100]
                              ))
                          ),
                          child: TextFormField(
                            validator: (input) { // ignore: missing_return
                              if(input.length < 6){
                                return 'Your password must be atleast 6 characters';
                              }
                            },
                            onSaved: (input) => _password = input,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none
                            ),
                            obscureText: true,

                          ),
                        )

                      ],
                    ),

                  ),
                  SizedBox(height: 20),
                  Center(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)
                      ),
                      color: Colors.red,
                      textColor: Colors.white,
                      onPressed: signUp,
                      child: Text('Register', style: TextStyle(fontSize: 15)),
                    ),
                  ),
//                  Container(
//                    height: 50,
//                    margin: EdgeInsets.symmetric(horizontal: 60),
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(50),
//                      color: Color.fromRGBO(250, 75, 0, 1)
//                    ),
//                    child: Center(
//                      child: Text("Login", style: TextStyle(color: Colors.white),),
//                    ),
//
//                  )
                ],
              ),
            ),

//            TextFormField(
//              validator: (input) { // ignore: missing_return
//                if(input.isEmpty){
//                  return 'Please type email';
//                }
//              },
//              onSaved: (input) => _email = input,
//              decoration: InputDecoration(
//                labelText: 'Email id'
//              ),
//
//            ),
//            TextFormField(
//              validator: (input) { // ignore: missing_return
//                if(input.length < 6){
//                  return 'Your password must be atleast 6 characters';
//                }
//              },
//              onSaved: (input) => _password = input,
//              decoration: InputDecoration(
//                  labelText: 'Password'
//              ),
//              obscureText: true,
//
//            ),
//            RaisedButton(
//              onPressed: signIn,
//              child: Text('Login'),
//            ),
//            RaisedButton(
//              onPressed: signUp,
//              child: Text('Register'),
//            )


          ],
        ),
//        child: Column(
//          children: <Widget>[
//            TextFormField(
//              validator: (input) { // ignore: missing_return
//                if(input.isEmpty){
//                  return 'Please type email';
//                }
//              },
//              onSaved: (input) => _email = input,
//              decoration: InputDecoration(
//                  labelText: 'Email id'
//              ),
//
//            ),
//            TextFormField(
//              validator: (input) { // ignore: missing_return
//                if(input.length < 6){
//                  return 'Your password must be atleast 6 characters';
//                }
//              },
//              onSaved: (input) => _password = input,
//              decoration: InputDecoration(
//                  labelText: 'Password'
//              ),
//              obscureText: true,
//
//            ),
//            RaisedButton(
//              onPressed: signUp,
//              child: Text('Sign up'),
//            )
//
//
//          ],
//        ),
      ),
    );
  }

  void signUp() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        FirebaseUser user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password)).user;
        user.sendEmailVerification();


        Navigator.of(context).pop();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPage()));
        //AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        //Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user)));

      }catch(e){
        print(e.message);

      }

    }
     else
        {
          Fluttertoast.showToast(
              msg: "Enter Valid Email-ID & Password",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 2,
              backgroundColor: Colors.lightGreenAccent,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }



  }

}
