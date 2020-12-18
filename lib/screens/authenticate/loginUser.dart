import 'package:dbapp/screens/authenticate/onboard.dart';
import 'package:dbapp/screens/home/hospitalHome.dart';
import 'package:dbapp/services/miniauth.dart';
import 'package:dbapp/services/auth.dart';
import 'package:dbapp/shared/colors.dart';
import 'package:dbapp/shared/style.dart';
import 'package:dbapp/shared/loading.dart';
import 'package:flutter/material.dart';
import '../home/home.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin>
    with SingleTickerProviderStateMixin {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  bool loading = false;
  //form state
  String email = '';
  String password = '';
  String error = '';

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1000));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeInOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: loading
            ? Loading()
            : Container(
                padding: EdgeInsets.only(top: 40.0, left: 50.0, right: 50),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: _iconAnimation.value * 265,
                            height: _iconAnimation.value * 250,
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new AssetImage(
                                        'assets/images/logo.png')))),
                        new Divider(height: 20.0, color: Colors.transparent),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 20.0),
                              new Text(
                                'Welcome Back',
                                style: TextStyle(
                                  fontFamily: 'GoogleSans',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),

                              SizedBox(height: 32.0),
                              TextFormField(
                                  decoration: textInputDecorations.copyWith(
                                      labelText: "Enter Email",
                                      labelStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: AppColors.mediLGrey,
                                          width: 2.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          borderSide: BorderSide(
                                              color: new Color(0xff0350C2)))),
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
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: AppColors.mediLGrey,
                                          width: 2.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          borderSide: BorderSide(
                                              color: new Color(0xff0350C2)))),
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  }),
                              SizedBox(height: 30),

                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 30),
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
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      setState(() {
                                        loading = true;
                                      });

                                      dynamic result =
                                          await _auth.signin(email, password);
                                      if (result == null) {
                                        setState(() {
                                          error = 'couldnt sign in ';
                                          loading = false;
                                        });
                                      } else {
                                        AuthMethods auth = new AuthMethods();
                                        var userDetails =
                                            await auth.getUserDetails();
                                        if (userDetails.type == "user") {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  Home(),
                                            ),
                                            (route) => false,
                                          );
                                        } else {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  HospitalHome(),
                                            ),
                                            (route) => false,
                                          );
                                        }
                                      }
                                    }
                                  },
                                ),
                              ),

                              SizedBox(height: 10),
                              Text("OR"),
                              SizedBox(height: 10),

                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                child: MaterialButton(
                                  minWidth: double.infinity,
                                  height: 48,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      side: BorderSide(
                                          color: AppColors.mediGrey)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 8.0, 0),
                                        child: new Image.asset(
                                          'assets/images/icons8-google-48.png',
                                          height: 35.0,
                                        ),
                                      ),
                                      Text(
                                        'Sign In with Google',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'GoogleSans'),
                                      ),
                                    ],
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      loading = true;
                                    });
                                    dynamic user = await _auth.googleSignIn();
                                    if (user == null) {
                                      setState(() {
                                        error = 'couldnt sign up ';
                                        loading = false;
                                      });
                                    } else {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Home(),
                                        ),
                                        (route) => false,
                                      );
                                    }
                                  },
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
                                    onTap: () => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterForm1())),
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
                                      color: Colors.red, fontSize: 14.0))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
