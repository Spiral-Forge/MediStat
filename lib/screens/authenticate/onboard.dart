import 'package:dbapp/screens/authenticate/loginUser.dart';
import 'package:dbapp/screens/authenticate/registerUser.dart';
import 'package:dbapp/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:dbapp/shared/loading.dart';
import 'package:dbapp/screens/authenticate/registerHospital.dart';

int visibleCard = 1;

String post = '';

Map<String, dynamic> userMap = {'type': ''};

class RegisterForm1 extends StatefulWidget {
  @override
  _RegisterForm1State createState() => _RegisterForm1State();
}

class _RegisterForm1State extends State<RegisterForm1>
    with SingleTickerProviderStateMixin {
  // final AuthService _auth = AuthService();
  final _formKey1 = GlobalKey<FormState>();
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  String error = '';
  bool loading = false;

  void initState() {
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1000));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeInOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
    super.initState();
    setState(() {
      post = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: loading
            ? Loading()
            : SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: new Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 50,
                    ),
                    child: Form(
                        key: _formKey1,
                        child: Center(
                          child: ListView(shrinkWrap: true, children: <Widget>[
                            new Divider(
                                height: 35.0, color: Colors.transparent),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Container(
                                  width: _iconAnimation.value * 265,
                                  height: _iconAnimation.value * 250,
                                  decoration: new BoxDecoration(
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: new AssetImage(
                                              'assets/images/logo.png')))),
                            ),
                            new Divider(
                                height: 35.0, color: Colors.transparent),
                            new Text(
                              'Register yourself as',
                              style: kTitleTextstyle,
                              textAlign: TextAlign.center,
                            ),
                            new Divider(
                                height: 32.0, color: Colors.transparent),
                            Column(children: <Widget>[
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 30),
                                  child: MaterialButton(
                                    minWidth: double.infinity,
                                    height: 48,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        userMap['type'] = 'Hospital';
                                      });
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterForm2()));
                                    },
                                    color: new Color(0xff0350C2),
                                    child: Text('Hospital',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'GoogleSans'),
                                        textAlign: TextAlign.center),
                                  )),
                              SizedBox(height: 15),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 30),
                                  child: MaterialButton(
                                    minWidth: double.infinity,
                                    height: 48,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        userMap['post'] = 'User';
                                      });
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UserRegister()));
                                    },
                                    color: new Color(0xff0350C2),
                                    child: Text('User',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'GoogleSans'),
                                        textAlign: TextAlign.center),
                                  )),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Already registered? ',
                                      style: TextStyle(
                                        color: const Color(0xFF959595),
                                        fontFamily: 'GoogleSans',
                                        fontSize: 14.5,
                                      )),
                                  SizedBox(height: 5.0),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UserLogin()));
                                    },
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 12),
                                      child: Text("Sign In Here",
                                          style: TextStyle(
                                              color: AppColors.mediBlue,
                                              fontSize: 14.5,
                                              fontFamily: 'GoogleSans',
                                              decoration:
                                                  TextDecoration.underline)),
                                    ),
                                  ),
                                ],
                              )
                            ])
                          ]),
                        )))));
  }
}
