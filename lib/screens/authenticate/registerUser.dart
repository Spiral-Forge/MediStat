import 'package:dbapp/screens/authenticate/loginUser.dart';
import 'package:dbapp/services/auth.dart';
import 'package:dbapp/shared/colors.dart';
import 'package:dbapp/shared/style.dart';
import 'package:dbapp/shared/loading.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';

class UserRegister extends StatefulWidget {
  final Function toggleView;
  UserRegister({this.toggleView});
  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //form state
  String email = '';
  String password = '';
  String error = '';
  //String contact='';
  String name = '';
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
            : Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 32),
                            Padding(
                              padding: EdgeInsets.fromLTRB(32, 32, 0, 0),
                              child: IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 50.0),
                                child: Center(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        // Container(
                                        //     width:  20.0,
                                        //     height: 21.0,
                                        //     decoration: new BoxDecoration(
                                        //         image: new DecorationImage(
                                        //             fit: BoxFit.fill,
                                        //             image: themeFlag
                                        //                 ? new AssetImage(
                                        //                     'assets/images/Protege_white_text.png')
                                        //                 : new AssetImage(
                                        //                     'assets/images/Protege no bg.png')))
                                        // ),
                                        new Divider(
                                            height: 35.0,
                                            color: Colors.transparent),
                                        Form(
                                          key: _formKey,
                                          child: Column(
                                            children: <Widget>[
                                              SizedBox(height: 20.0),
                                              TextFormField(
                                                  decoration: textInputDecorations
                                                      .copyWith(
                                                          labelText:
                                                              "Enter Name",
                                                          labelStyle: TextStyle(
                                                            fontFamily:
                                                                'GoogleSans',
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          8)),
                                                              borderSide: BorderSide(
                                                                  color: new Color(
                                                                      0xff0350C2)))),
                                                  validator: (val) =>
                                                      val.isEmpty
                                                          ? 'Enter an name'
                                                          : null,
                                                  onChanged: (val) {
                                                    setState(() => name = val);
                                                  }),

                                              // SizedBox(height: 20.0),
                                              // TextFormField(
                                              //     decoration: textInputDecorations.copyWith(
                                              //         labelText: "Enter contact number",
                                              //         labelStyle: TextStyle(
                                              //           fontFamily: 'GoogleSans',
                                              //         ),
                                              //         focusedBorder: OutlineInputBorder(
                                              //             borderRadius: BorderRadius.all(
                                              //                 Radius.circular(8)),
                                              //             borderSide: BorderSide(
                                              //                 color: new Color(0xff0350C2)))),
                                              //     validator: (val) =>
                                              //         val.isEmpty ? 'Enter a contact number' : null,
                                              //     onChanged: (val) {
                                              //       setState(() => contact = val);
                                              //     }),
                                              SizedBox(height: 20.0),
                                              TextFormField(
                                                  decoration: textInputDecorations
                                                      .copyWith(
                                                          labelText:
                                                              "Enter Email",
                                                          labelStyle: TextStyle(
                                                            fontFamily:
                                                                'GoogleSans',
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          8)),
                                                              borderSide: BorderSide(
                                                                  color: new Color(
                                                                      0xff0350C2)))),
                                                  validator: (val) =>
                                                      val.isEmpty
                                                          ? 'Enter an email'
                                                          : null,
                                                  onChanged: (val) {
                                                    setState(() => email = val);
                                                  }),
                                              SizedBox(height: 20.0),
                                              TextField(
                                                  decoration: textInputDecorations
                                                      .copyWith(
                                                          labelText:
                                                              "Enter Password",
                                                          labelStyle: TextStyle(
                                                            fontFamily:
                                                                'GoogleSans',
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          8)),
                                                              borderSide: BorderSide(
                                                                  color: new Color(
                                                                      0xff0350C2)))),
                                                  obscureText: true,
                                                  onChanged: (val) {
                                                    setState(
                                                        () => password = val);
                                                  }),
                                              SizedBox(height: 30),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 30),
                                                child: MaterialButton(
                                                  minWidth: double.infinity,
                                                  height: 48,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  color: new Color(0xff0350C2),
                                                  child: Text(
                                                    'Sign Up',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily:
                                                            'GoogleSans'),
                                                  ),
                                                  onPressed: () async {
                                                    if (_formKey.currentState
                                                        .validate()) {
                                                      setState(() {
                                                        loading = true;
                                                      });

                                                      dynamic result =
                                                          await _auth.register(
                                                              email,
                                                              password,
                                                              name);
                                                      if (result == null) {
                                                        setState(() {
                                                          error =
                                                              'couldnt sign up ';
                                                          loading = false;
                                                        });
                                                      } else {
                                                        Navigator
                                                            .pushAndRemoveUntil(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                Home(),
                                                          ),
                                                          (route) => false,
                                                        );
                                                      }
                                                    }
                                                  },
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Text("OR"),
                                              SizedBox(height: 10),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 30),
                                                child: MaterialButton(
                                                  minWidth: double.infinity,
                                                  height: 48,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                      side: BorderSide(
                                                          color: AppColors
                                                              .mediGrey)),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0, 0, 8.0, 0),
                                                        child: new Image.asset(
                                                          'assets/images/icons8-google-48.png',
                                                          height: 35.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Sign Up with Google',
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontFamily:
                                                                'GoogleSans'),
                                                      ),
                                                    ],
                                                  ),
                                                  onPressed: () async {
                                                    setState(() {
                                                      loading = true;
                                                    });
                                                    dynamic user = await _auth
                                                        .googleSignIn();
                                                    if (user == null) {
                                                      setState(() {
                                                        error =
                                                            'couldnt sign up ';
                                                        loading = false;
                                                      });
                                                    } else {
                                                      Navigator
                                                          .pushAndRemoveUntil(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              Home(),
                                                        ),
                                                        (route) => false,
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                              // Container(
                                              //   margin: EdgeInsets.symmetric(horizontal: 50),
                                              //   child: MaterialButton(
                                              //     minWidth: double.infinity,
                                              //     height: 48,
                                              //     shape: RoundedRectangleBorder(
                                              //       borderRadius: BorderRadius.circular(50.0),
                                              //     ),
                                              //     color: new Color(0xff0350C2),
                                              //     child: Row(
                                              //       children: [
                                              //         Icon(
                                              //           Icons.email,
                                              //           color: Colors.white,
                                              //         ),
                                              //         Text(
                                              //           ' Sign In With Google',
                                              //           style: TextStyle(
                                              //               color: Colors.white,
                                              //               fontSize: 15,
                                              //               fontWeight: FontWeight.w600,
                                              //               fontFamily: 'GoogleSans'),
                                              //         ),
                                              //       ],
                                              //     ),
                                              //     onPressed: () async {
                                              //       dynamic user = await _auth.googleSignIn();
                                              //       if (user == null) {
                                              //         setState(() {
                                              //           error = 'couldnt sign up ';
                                              //           loading = false;
                                              //         });
                                              //       } else {
                                              //         Navigator.pushAndRemoveUntil(
                                              //           context,
                                              //           MaterialPageRoute(
                                              //             builder: (BuildContext context) =>
                                              //                 Home(),
                                              //           ),
                                              //           (route) => false,
                                              //         );
                                              //       }
                                              //     },
                                              //   ),
                                              // ),
                                              SizedBox(height: 10.0),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text('Already Registered? ',
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFF959595),
                                                          fontSize: 14.5,
                                                          fontFamily:
                                                              'GoogleSans')),
                                                  SizedBox(height: 5.0),
                                                  InkWell(
                                                    onTap: () => {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  UserLogin()))
                                                    },
                                                    child: Container(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 12),
                                                      child: Text("Login Here",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'GoogleSans',
                                                              color: new Color(
                                                                  0xff0350C2),
                                                              fontSize: 14.5,
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline)),
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
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ));
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.brown[100],
  //     appBar: AppBar(
  //       backgroundColor: Colors.brown,
  //       elevation: 0.0,
  //       title:Text("appbar"),
  //       actions: <Widget>[
  //         FlatButton.icon(
  //           icon:Icon(Icons.person),
  //           label:Text('register'),
  //           onPressed: (){
  //             print("yo");
  //           },
  //         )
  //       ],
  //     ),
  //     body: Container(
  //       padding: EdgeInsets.symmetric(vertical:20.0,horizontal:50.0),
  //         child:Form(
  //           key:_formKey,
  //                     child: Column(
  //             children: <Widget>[
  //               SizedBox(height:20.0),
  //               TextFormField(
  //                 decoration: textInputDecorations.copyWith(
  //                      labelText: "Enter Email",
  //                 ),
  //                 validator: (val) => val.isEmpty ? 'Enter an email' :null,
  //                 onChanged: (val){
  //                   setState(()=>email=val);
  //                 }
  //               ),
  //               SizedBox(height:20.0),
  //               TextFormField(
  //                 decoration: textInputDecorations.copyWith(
  //                      labelText: "Enter Password",
  //                 ),
  //                 obscureText: true,
  //                 onChanged: (val){
  //                   setState(()=>password=val);
  //                 }
  //               ),
  //               SizedBox(height:20.0),
  //               RaisedButton(
  //                 color:Colors.green,
  //                 child:Text(
  //                   'Sign In',
  //                   style: TextStyle(color:Colors.white),
  //                   ),
  //                   onPressed: () async{
  //
  //                            print("user isss before");
  //                           dynamic user=await _auth.googleSignIn();
  //                           print("user isss");
  //                           print(user);

  //                   },
  //               ),
  //               SizedBox(height:20.0),
  //                 Text(
  //                   error,
  //                   style:TextStyle(
  //                     color:Colors.red,
  //                     fontSize: 14.0
  //                   )
  //                 )

  //             ],
  //           ),
  //         )
  //         )

  //     );

  // }
}
