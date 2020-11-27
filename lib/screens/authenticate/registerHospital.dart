import 'package:dbapp/screens/constants/colors.dart';
import 'package:dbapp/screens/home/home.dart';
// import 'package:dbapp/lib/screens/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:dbapp/shared/loading.dart';
import 'package:flutter/services.dart';
import 'package:dbapp/services/auth.dart';
// import 'package:dbapp/screens/authenticate/form3.dart';

String name = '';
String contact = '';
String email = '';
String password = '';
String address='';


class RegisterForm2 extends StatefulWidget {
  //taken from parent props:
  var userMap = new Map<String, dynamic>();
  Function toggleView;
  RegisterForm2( {this.toggleView});

  @override
  _RegisterForm2State createState() => _RegisterForm2State(userMap);
}

class _RegisterForm2State extends State<RegisterForm2> {
  final Map<String, dynamic> userMap;
  _RegisterForm2State(this.userMap);
  final _formKey2 = GlobalKey<FormState>();
  final AuthService _auth=AuthService();

  String error = '';
  bool loading = false;

  void initState() {
    super.initState();
    setState(() {
      name = '';
      contact = '';
      email = '';
      password = '';
      address='';

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: loading
          ? Loading()
          : Column(children: [
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
                                SizedBox(height: 25),
                                Expanded(
                                    child: SizedBox(
                                        child: Padding(
                                  padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                                  child: Form(
                                      key: _formKey2,
                                      child:
                                          ListView(shrinkWrap: true, children: <
                                              Widget>[
                                        new Divider(
                                            height: 35.0,
                                            color: Colors.transparent),
                                        new Text(
                                          'Register With Us',
                                          style: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        new Divider(
                                            height: 35.0,
                                            color: Colors.transparent),
                                        new TextFormField(
                                            keyboardType: TextInputType.text,
                                            style:
                                                TextStyle(color: Colors.grey),
                                            decoration: const InputDecoration(
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'GoogleSans'),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue),
                                              ),
                                              border: UnderlineInputBorder(),
                                              icon: const Icon(Icons.person),
                                              labelText: 'Hospital Name',
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Required';
                                              }
                                              return null;
                                            },
                                            onChanged: (val) {
                                              setState(() => name = val);
                                            }),
                                        TextFormField(
                                            keyboardType: TextInputType.phone,
                                            style:
                                                TextStyle(color: Colors.grey),
                                            decoration: const InputDecoration(
                                                labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'GoogleSans',
                                                ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue),
                                                ),
                                                border: UnderlineInputBorder(),
                                                icon: const Icon(Icons.phone),
                                                labelText: 'Hospital Contact No.'),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Required';
                                              } else if (value.length != 10) {
                                                return 'Incorrect';
                                              }
                                              return null;
                                            },
                                            onChanged: (val) {
                                              setState(() => contact = val);
                                            }),
                                        TextFormField(
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style:
                                                TextStyle(color: Colors.grey),
                                            decoration: const InputDecoration(
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'GoogleSans'),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue),
                                              ),
                                              border: UnderlineInputBorder(),
                                              icon: const Icon(Icons.email),
                                              labelText: 'Hospital Email id',
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Required';
                                              }
                                              return null;
                                            },
                                            onChanged: (val) {
                                              setState(() => email = val);
                                            }),

                                            TextFormField(
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style:
                                                TextStyle(color: Colors.grey),
                                            decoration: const InputDecoration(
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'GoogleSans'),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue),
                                              ),
                                              border: UnderlineInputBorder(),
                                              icon: const Icon(Icons.lock),
                                              labelText: 'Hospital Password',
                                            ),
                                            obscureText: true,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Required';
                                              }
                                              return null;
                                            },
                                            onChanged: (val) {
                                              setState(() => password = val);
                                            }),

                                             TextFormField(
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style:
                                                TextStyle(color: Colors.grey),
                                            decoration: const InputDecoration(
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'GoogleSans'),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue),
                                              ),
                                              border: UnderlineInputBorder(),
                                              icon: const Icon(Icons.home),
                                              labelText: 'Hospital Address',
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Required';
                                              }
                                              return null;
                                            },
                                            onChanged: (val) {
                                              setState(() => address = val);
                                            }),

                                        // TextFormField(
                                        //     style:
                                        //         TextStyle(color: Colors.grey),
                                        //     decoration: const InputDecoration(
                                        //       labelStyle: TextStyle(
                                        //           color: Colors.grey,
                                        //           fontFamily: 'GoogleSans'),
                                        //       enabledBorder:
                                        //           UnderlineInputBorder(
                                        //         borderSide: BorderSide(
                                        //             color: Colors.grey),
                                        //       ),
                                        //       focusedBorder:
                                        //           UnderlineInputBorder(
                                        //         borderSide: BorderSide(
                                        //             color: Colors.blue),
                                        //       ),
                                        //       border: UnderlineInputBorder(),
                                        //       icon: const Icon(Icons.security),
                                        //       labelText: 'Password',
                                        //     ),
                                        //     validator: (value) {
                                        //       if (value.length < 6) {
                                        //         return 'Enter a password 6+ chars long';
                                        //       }
                                        //       return null;
                                        //     },
                                        //     obscureText: true,
                                        //     onChanged: (val) {
                                        //       setState(() => password = val);
                                        //     }),
                                        new Divider(
                                            height: 35.0,
                                            color: Colors.transparent),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                height: 40,
                                                child: new MaterialButton(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    color: AppColors.MediBlue,
                                                    onPressed: () async {
                                                      if (_formKey2.currentState
                                                          .validate()) {
                                                        setState(() {
                                                          widget.userMap['name'] =name;
                                                          userMap['contact'] =
                                                              contact;
                                                          userMap['address'] =
                                                              address;
                                                          userMap['email'] =
                                                              email;
                                                          userMap['password'] =
                                                              password;
                                                        });
                                                        var user=await _auth.registerHospital(userMap);
                                                        if(user!=null){
                                                          Navigator.pushAndRemoveUntil(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (BuildContext context) => Home(),
                                                              ),
                                                              (route) => false,
                                                            );
                                                        }
                                                        // Navigator.push(
                                                        //     context,
                                                        //     MaterialPageRoute(
                                                        //         builder: (context) =>
                                                        //             RegisterForm3(
                                                        //                 userMap)));
                                                      }
                                                    },
                                                    
                                                    child: Material(
                                                        borderRadius: BorderRadius.circular(10),
                                                        color: AppColors.MediBlue,
                                                         child: Container(
                                                    child: Text('Register',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'GoogleSans',
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600))),
                                                    )),
                                              ),
                                                
                                               
                                              //   onPressed: () async {
                                              //   if (_formKey.currentState.validate()) {
                                              //     setState(() {
                                              //       loading = true;
                                              //     });
                                              //     dynamic result =
                                              //         await _auth.register(email, password);
                                              //     if (result == null) {
                                              //       setState(() {
                                              //         error = 'couldnt sign in ';
                                              //         loading = false;
                                              //       });
                                              //     }
                                              //   }
                                              // },
                                          ]),
                                          
                                          
                                          
                                        new Divider(
                                            height: 18.0,
                                            color: Colors.transparent),
                                      ])),
                                )))
                              ]))))
            ]),
    );
  }
}
