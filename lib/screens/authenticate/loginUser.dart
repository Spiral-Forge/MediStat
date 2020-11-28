import 'package:dbapp/screens/authenticate/signin.dart';
import 'package:dbapp/screens/authenticate/register.dart';
import 'package:dbapp/screens/home/hospitalHome.dart';
import 'package:dbapp/screens/vc/miniauth.dart';
import 'package:dbapp/services/auth.dart';
import 'package:dbapp/shared/constants.dart';
import 'package:dbapp/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../home/home.dart';


class UserLogin extends StatefulWidget {
  final Function toggleView;
  UserLogin({this.toggleView});
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final AuthService _auth=AuthService();
   final _formKey=GlobalKey<FormState>();
  bool loading=false;
  //form state
  String email='';
  String password='';
  String error='';
  @override
  void initState() {
    super.initState();
    // _iconAnimationController = new AnimationController(
    //     vsync: this, duration: new Duration(milliseconds: 1000));
    // _iconAnimation = new CurvedAnimation(
    //     parent: _iconAnimationController, curve: Curves.easeInOut);
    // _iconAnimation.addListener(() => this.setState(() {}));
    // _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: loading
            ? Loading()
            : Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Divider(height: 35.0, color: Colors.transparent),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 20.0),
                              TextFormField(
                                  decoration: textInputDecorations.copyWith(
                                      labelText: "Enter Email",
                                      labelStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          borderSide: BorderSide(
                                              color:
                                                  new Color(0xff0350C2)))),
                                  validator: (val) =>
                                      val.isEmpty ? 'Enter an email' : null,
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  }),
                              SizedBox(height: 20.0),
                              TextField(
                                  decoration: textInputDecorations.copyWith(
                                      labelText: "Enter Password",
                                      labelStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          borderSide: BorderSide(
                                              color:
                                                  new Color(0xff0350C2)))),
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  }),
                              SizedBox(height: 20),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                child: MaterialButton(
                                  minWidth: double.infinity,
                                  height: 48,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  color: new Color(0xff0350C2),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'GoogleSans'),
                                  ),
                                   onPressed: () async{
                                    if(_formKey.currentState.validate()){
                                          setState(() {
                                            loading=true;
                                          });
                                          
                                          dynamic result=await _auth.signin(email, password);
                                          if(result == null){
                                              setState(() {
                                                error='couldnt sign in ';
                                                loading=false;
                                              });
                                          }else{
                                            AuthMethods auth=new AuthMethods();
                                            var userDetails=await auth.getUserDetails();
                                            if(userDetails.type=="user"){
                                                      Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (BuildContext context) => Home(),
                                                ),
                                                (route) => false,
                                              );
                                            }else{
                                               Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (BuildContext context) => HospitalHome(),
                                                ),
                                                (route) => false,
                                              );
                                            }
                                             
                                          }
                                      }
                                  },
                                ),
                              ),
                              SizedBox(height: 15),
                              Text("OR"),
                              SizedBox(height: 15),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                child: MaterialButton(
                                  minWidth: double.infinity,
                                  height: 48,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  color: new Color(0xff0350C2),
                                  child: Row(
                                    children: [
                                      Icon(Icons.g_translate_rounded,color: Colors.white,),
                                      Text(
                                        ' Sign In With Google',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'GoogleSans'),
                                      ),
                                    ],
                                  ),
                                  onPressed: () async{                                
                                    dynamic user=await _auth.googleSignIn();
                                    if(user == null){
                                      setState(() {
                                        error='couldnt sign up ';
                                        loading=false;
                                      });
                                    }else{
                                      print("going from here");
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) => Home(),
                                        ),
                                        (route) => false,
                                      );
                                     
                                    }
                                  }
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('New Here? ',
                                      style: TextStyle(
                                          color: const Color(0xFF959595),
                                          fontSize: 14.5,
                                          fontFamily: 'GoogleSans')),
                                  SizedBox(height: 5.0),
                                  InkWell(
                                    onTap: widget.toggleView,
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 12),
                                      child: Text("Register NOW",
                                          style: TextStyle(
                                              fontFamily: 'GoogleSans',
                                              color: new Color(0xff0350C2),
                                              fontSize: 14.5,
                                              decoration:
                                                  TextDecoration.underline)),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.0),
                              Text(error,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14.0))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )));
  }

}